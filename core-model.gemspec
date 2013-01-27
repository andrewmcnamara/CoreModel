require File.expand_path('../lib/core_model/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ["Andrew McNamara"]
  gem.description = 'Simple DSL to allow a core data models to be created programmatically for RubyMotion'
  gem.summary = 'Simple Core Data Model DSL for RubyMotion'

  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^(test|spec|lib_spec|features)/})
  gem.name = "core-model"
  gem.require_paths = ["lib"]
  gem.version = CoreModel::VERSION

  gem.add_development_dependency 'bubble-wrap'
  gem.add_development_dependency 'motion-redgreen', '~> 0.1.0'
  gem.add_development_dependency 'rake'
end