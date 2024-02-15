require 'rubygems'
require_relative './config/environment'
require 'sinatra/activerecord/rake'

begin
  require 'rspec/core/rake_task'

  desc "Run application tests"
  RSpec::Core::RakeTask.new
  task :default => :spec
rescue LoadError
end

desc 'List defined routes'
task :routes do
  require './config/environment'

  controllers = [ApplicationController] + ApplicationController.subclasses

  # Adapted from: https://stackoverflow.com/a/43906332/35345
  controllers.map(&:routes).each do |controller_routes|
    controller_routes.map do |method, routes|
      routes.map { |r| r.first.to_s }.map do |route|
        "#{method.rjust(7, ' ')} #{route}"
      end
    end.flatten.sort.each do |route|
      puts route
    end
  end
end
