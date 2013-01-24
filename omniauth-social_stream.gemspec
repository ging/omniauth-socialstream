# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/social_stream/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = [ "Antonio Tapiador",
                       "GING - DIT - UPM" ]
  gem.email         = [ "social-stream@dit.upm.es"]
  gem.description   = "Official OmniAuth strategy for Social Stream."
  gem.summary       = "Social Stream is a Ruby on Rails engine for building social network websites. This is the official OmniAuth strategy for Social Stream's Oauth2 Server."
  gem.homepage      = "https://github.com/ging/omniauth-social_stream"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-social_stream"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::SocialStream::VERSION

  gem.add_dependency 'omniauth-oauth2', '~> 1.1.1'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
