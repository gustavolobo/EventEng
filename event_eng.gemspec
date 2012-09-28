$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_eng/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_eng"
  s.version     = EventEng::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EventEng."
  s.description = "TODO: Description of EventEng."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "haml", "~> 3.1.7"
  s.add_dependency "haml-rails"
  s.add_dependency "formtastic", "~> 2.2.0"
  
  s.add_development_dependency "sqlite3"
end
