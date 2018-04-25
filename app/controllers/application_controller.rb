require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  helpers do
    def current_user(session_hash)
      User.find(session_hash[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end
end
