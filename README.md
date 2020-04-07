# Daily Diary

## Project setup

```bash
# Initialise bundle
bundle init

# Add the following gems to the Gemfile
gem 'capybara'
gem 'rspec'
gem 'rubocop'
gem 'simplecov'
gem 'simplecov-console'
gem 'sinatra'

# run bundle install
bundle

# Initialise rspec
rspec --init

# Create a lib folder
mkdir lib

# Create a rackup config file
touch config.ru

# with the following contents
require_relative './daily_diary.rb'
run DailyDiary

# update speci_helper.rb #
##########################

# add the following requires
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'daily_diary.rb')

# add the following lines
ENV['RACK_ENV'] = 'test'
Capybara.app = DailyDiary

# add the following to enable simplecov
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# Set up a basic modular sinatra app #
######################################
touch daily_diary.rb

# add the following
require 'sinatra/base'

class DailyDiary < Sinatra::Base
  get '/' do
    'Hello world'
  end

  run! if app_file == $0
end

```