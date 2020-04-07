require 'sinatra/base'
require_relative './lib/entry'

class DailyDiary < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/entries' do
    @titles = Entry.all_titles
    erb :entries
  end

  run! if app_file == $0
end
