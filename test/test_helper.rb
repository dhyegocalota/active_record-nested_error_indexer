$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'bundler/setup'
require 'active_record/nested_error_indexer'
require 'minitest/autorun'
require 'minitest/utils'

FileList['./test/support/**/*.rb'].each { |file| require file }
