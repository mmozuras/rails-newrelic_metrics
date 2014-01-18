# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

require 'rails/newrelic_metrics/version'

Gem::Specification.new do |s|
  s.name        = 'rails-newrelic_metrics'
  s.version     = Rails::NewRelicMetrics::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Mindaugas Mozūras'
  s.email       = 'mindaugas.mozuras@gmail.com'
  s.homepage    = 'http://github.org/mmozuras/rails-newrelic_metrics'
  s.summary     = 'Retrieve various metrics, unused actions for your Rails app, courtesy of NewRelic'

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files         = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'rake', '~> 10.1.0'
  s.add_development_dependency 'rspec', '~> 2.14.0'
end
