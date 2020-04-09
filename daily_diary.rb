require 'sinatra/base'
require_relative './lib/entry'
require_relative './lib/db_connection'

class DailyDiary < Sinatra::Base
  get '/' do
    redirect '/entries'
  end

  get '/entries' do
    @entries = Entry.all
    erb :entries
  end

  get '/new-entry' do
    erb :entry_form
  end

  post '/entry' do
    Entry.create(params[:title], params[:body])
    redirect 'entries'
  end

  get '/entries/:id' do
    @entry = Entry.find_by_id(params['id'])
    erb :entry
  end

  run! if app_file == $0
end
