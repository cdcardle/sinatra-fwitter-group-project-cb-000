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

  post '/signup' do
    puts params
    @user = User.create(params)
    erb :'users/tweets'
  end

  get '/login' do
    if logged_in?
      redirect to '/users/tweets'
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    session[user_id] = @user.id

    erb :'users/tweets'
  end

  get 'logout' do
    session.clear
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
