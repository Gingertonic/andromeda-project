require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :home
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def user_id
      current_user.id
    end

    #Downcases Username/Emails Provided by Params to Prevent Repeat Usernames Due to Caps

    def username
      params[:username].downcase
    end

    def email
      params[:email].downcase
    end

    def password
      params[:password]
    end

    #Planets/Aliens

     def name
       params[:name].downcase
     end

     def classification
       params[:classification].downcase
     end

     def description
       params[:description]
     end

     def planet
       params[:planet].downcase
     end

     #URL Slug

     def slug
       params[:slug]
     end

  end


end
