require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "not telling"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(params)
    session[:id] = @user.id

    redirect 'users/tweets'
  end

  get '/login' do
    if logged_in?
      redirect "/<%= current_user.slug %>/tweets"
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    session[:id] = @user.id

    erb :'users/tweets'
  end

  get '/:slug' do

  end

  get '/logout' do
    session.clear
    redirect '/'
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
