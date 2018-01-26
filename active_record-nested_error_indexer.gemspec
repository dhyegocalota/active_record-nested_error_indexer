$:.push File.expand_path('../lib', __FILE__)

require './lib/active_record/nested_error_indexer/version'

Gem::Specification.new do |spec|
  spec.name        = 'active_record-nested_error_indexer'
  spec.version     = ActiveRecord::NestedErrorIndexer::Version::STRING
  spec.authors     = ['Dhyego Fernando']
  spec.email       = ['dhyegofernando@gmail.com']

  spec.summary     = 'Monkey patch to index nested errors for ActiveRecord 4'
  spec.description = spec.summary
  spec.homepage    = 'http://github.com/dhyegofernando/active_record-nested_error_indexer'
  spec.license     = 'MIT'

  spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.add_dependency 'activerecord', '~> 4.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-utils'
  spec.add_development_dependency 'pry-meta'
end
