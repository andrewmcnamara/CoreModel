require File.expand_path('../lib/core_model/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ["Andrew McNamara"]
  #gem.email = ["francis@ignition.hk"]
  gem.description = "DSL to  core data model for RubyMotion"
  gem.summary = "Stubbing and mocking for RubyMotion"
  #gem.homepage = "https://github.com/siuying/motion-stump"

  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^(test|spec|lib_spec|features)/})
  gem.name = "core-model"
  gem.require_paths = ["lib"]
  gem.version = CoreModel::VERSION

  gem.add_development_dependency 'motion-redgreen', '~> 0.1.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency  'bubble-wrap'
end