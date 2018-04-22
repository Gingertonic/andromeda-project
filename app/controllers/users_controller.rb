class UsersController < ApplicationController

  get "/" do
    erb :home
  end

  get "/signup" do
    erb :'users/signup'
  end

  get "/login" do
    erb :'users/login'
  end

  post "login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/profile"
    else
    redirect "/home"
    end
  end

  get "/profile" do
    # if logged_in?
      erb :'users/profile'
    # else
    #   redirect to "/home"
    # end
  end

end
