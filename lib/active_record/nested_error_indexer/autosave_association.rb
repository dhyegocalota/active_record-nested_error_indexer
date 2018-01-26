module ActiveRecord
  module NestedErrorIndexer
    module AutosaveAssociation
      extend ActiveSupport::Concern

      included do
        mattr_accessor :index_nested_attribute_errors, instance_writer: false
        self.index_nested_attribute_errors = false
      end

      private

      # Validate the associated records if <tt>:validate</tt> or
      # <tt>:autosave</tt> is turned on for the association specified by
      # +reflection+.
      def validate_collection_association(reflection)
        if association = association_instance_get(reflection.name)
          if records = associated_records_to_validate_or_save(association, new_record?, reflection.options[:autosave])
            records.each_with_index { |record, index| association_valid?(reflection, record, index) }
          end
        end
      end

      # Returns whether or not the association is valid and applies any errors to
      # the parent, <tt>self</tt>, if it wasn't. Skips any <tt>:autosave</tt>
      # enabled records if they're marked_for_destruction? or destroyed.
      def association_valid?(reflection, record, index=nil)
        return true if record.destroyed? || (reflection.options[:autosave] && record.marked_for_destruction?)

        validation_context = self.validation_context unless [:create, :update].include?(self.validation_context)
        unless valid = record.valid?(validation_context)
          if reflection.options[:autosave]
            record.errors.each do |attribute, message|
              attribute =
                if index.nil? || (!reflection.options[:index_errors] && !ActiveRecord::Base.index_nested_attribute_errors)
                  "#{reflection.name}.#{attribute}"
                else
                  "#{reflection.name}[#{index}].#{attribute}"
                end
              errors[attribute] << message
              errors[attribute].uniq!
            end
          else
            errors.add(reflection.name)
          end
        end
        valid
      end
    end
  end
end
