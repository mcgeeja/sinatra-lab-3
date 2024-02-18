ENV['APP_ENV'] = 'test'
SINATRA_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require_relative '../config/environment'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.expect_with(:rspec) { |c| c.syntax = [:expect, :should] }

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

# The rest of this configuration is specific to integration testing, and would
# normally be in a file that is only required by the integration tests.
# However, since we are only writing integration tests for this app,
# I am including it here so that you can see all of the configuration in one
# place.
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app
# NOTE: Change the javascript_driver to :selenium_chrome_headless
# once you've gotten over the novelty of seeing your tests run live!
Capybara.javascript_driver = :selenium_chrome_headless
Capybara.save_path = '../tmp'
Capybara.server = :puma, { Silent: true }

RSpec.configure do |config|
  config.include Capybara
end

def expect_task_list_to_be_exactly(*expected_todos)
  page.should have_content("Together, we can TODO it!")
  page.should have_css("ul#todos")
  todo_lis = page.find_all("ul#todos li")
  todos_text = todo_lis.map{|todo_li| todo_li.text}
  todos_text.should eq expected_todos
end
