# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/stendhal/version"

Gem::Specification.new do |s|
  s.name        = "guard-stendhal"
  s.version     = Guard::StendhalVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josep M. Bach"]
  s.email       = ["josep.m.bach@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/guard-stendhal"
  s.summary     = %q{Guard gem for Stendhal}
  s.description = %q{Guard::Stendhal automatically runs your specs with stendhal}

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project = "guard-stendhal"

  s.add_dependency 'guard', '>= 0.2.0'
  
  s.add_development_dependency 'bundler', '~> 1.0.3'
  s.add_development_dependency 'rspec',   '~> 2.1.0'
  s.add_development_dependency 'stendhal'


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
