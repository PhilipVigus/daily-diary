require 'sinatra/base'
require_relative './lib/entry'

class DailyDiary < Sinatra::Base
  get '/' do
    redirect '/entries'
  end

  get '/entries' do
    @titles = Entry.all_titles
    erb :entries
  end

  get '/entry-form' do
    erb :entry_form
  end

  run! if app_file == $0
end
