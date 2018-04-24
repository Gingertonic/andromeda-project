class UsersController < ApplicationController


  get "/users/:slug" do
    if logged_in?
      @user = current_user
      erb :'users/profile'
    else
      redirect to "/"
    end
  end

  get "/signup" do
    erb :'users/signup'
  end

  post "/signup" do
    @user = User.create(params)
    if @user.save
      session[:id] = @user.id
      redirect to "/login"
    else
      flash[:message] = "Flash message"
      redirect to '/signup'
    end
  end


  get "/login" do
    if logged_in?
      redirect "/logout"
    else
    erb :'users/login'
    end
  end


  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/profile"
    else
      flash[:message] = "*Please fill out each field"
    end
    redirect to "/login"
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
    end
  end





end
