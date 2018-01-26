require 'active_record'

module ActiveRecord
  module NestedErrorIndexer
  end
end

require 'active_record/nested_error_indexer/version'
require 'active_record/nested_error_indexer/associations/builder/has_many'
require 'active_record/nested_error_indexer/autosave_association'

ActiveRecord::Associations::Builder::HasMany.prepend ActiveRecord::NestedErrorIndexer::Associations::Builder::HasMany
ActiveRecord::Base.prepend ActiveRecord::NestedErrorIndexer::AutosaveAssociation
