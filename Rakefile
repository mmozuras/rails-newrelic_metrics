#!/usr/bin/env rake
require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)

desc 'Bundle the gem'
task :bundle do
  sh 'bundle check || bundle install'
  sh 'gem build *.gemspec'
  sh 'gem install *.gem'
end

task(:default).clear
task default: [:bundle, :spec]
