require 'sinatra/base'
require_relative './lib/entry'

class DailyDiary < Sinatra::Base
  get '/' do
    redirect '/entries'
  end

  get '/entries' do
    @titles = Entry.all
    erb :entries
  end

  get '/new-entry' do
    erb :entry_form
  end

  post '/entry' do
    Entry.create(params[:title], params[:body])
    redirect 'entries'
  end

  run! if app_file == $0
end
