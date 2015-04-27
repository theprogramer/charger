$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "charger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "charger"
  s.version     = Charger::VERSION
  s.authors     = ["Thiago Miranda"]
  s.email       = ["theprogramer@theprogramer.com.br"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Charger."
  s.description = "TODO: Description of Charger."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
