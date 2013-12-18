# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.

require 'rubygems'
require 'bundler/setup'
require 'capybara/rspec'

Bundler.require :default

Dir["support/**/*.rb"].each {|f| require_relative f }

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome

# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end
