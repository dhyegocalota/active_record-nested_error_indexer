module ActiveRecord
  module NestedErrorIndexer
    module Associations
      module Builder
        module HasMany
          def valid_options
            super + [:index_errors]
          end
        end
      end
    end
  end
end
