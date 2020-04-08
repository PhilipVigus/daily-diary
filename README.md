# Daily Diary

## Project setup

```bash
# Initialise bundle
bundle init

# Add the following gems to the Gemfile
gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop'
gem 'simplecov'
gem 'simplecov-console'
gem 'sinatra'

# run bundle install
bundle

# Initialise rspec
rspec --init

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

# initialise git
git init

# do the first commit
git add .
git commit -m 'First commit'

## Setting up MVC

```bash
# create model and views folders
mkdir lib
mkdir views

# add an index.erb view and move the "Hello world" string into it
# change the '/' route to erb :index

# add unit and feature tests to make sure that tests are wired up properly

```

## Set up postgres

```bash
# Install it
brew install postgresql

# Set it to start every time you log in
brew services start postgresql

# Test it's installed - this starts the CLI
psql postgres

# Then run the following
# Create a database with the same name as your username
# this will automatically be connected to when you start up
CREATE DATABASE "student";
# list databases
\l
# quit
\q
```

## Setup databases

```bash
# run the rakefile with the default task
rake
```

## Implementation

### First user story

```
As a user
So that I can browse my previous entries
I want to see a list of Diary Entry Titles
```

- Initial implementation was with hard-coded values
- Refactor added PG gem, used to connect to DB set up at start from within Entry.all method