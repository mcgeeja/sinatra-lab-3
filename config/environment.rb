ENV['APP_ENV'] ||= "development"
SINATRA_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require 'bundler/setup'
Bundler.require(:default, ENV['APP_ENV'])

require 'sinatra/activerecord'
require 'sinatra/flash'
require './app/controllers/application_controller'


# Equivalent to `require_all 'app'`
Dir[SINATRA_ROOT + "/app/**/**.rb"].each do |file|
  require file
end
