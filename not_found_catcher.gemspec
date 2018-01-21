$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "not_found_catcher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "not_found_catcher"
  s.version     = NotFoundCatcher::VERSION
  s.authors     = ["Marino Bonetti"]
  s.email       = ["marinobonetti@gmail.com"]
  s.homepage    = "http://gitbuh.com/oniram88/NotFoundCatcher"
  s.summary     = "Mountable Engine to catch not_found_errors and to administrate redirects "
  s.description = "Mountable Engine to catch not_found_errors and to administrate redirects "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
