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
    @user = User.create(username: username, email: email, password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect to "/login"
    elsif User.find_by(username: username)
      flash[:message] = "* Username unavailable"
      redirect to '/signup'
    elsif User.find_by(email: email)
      flash[:message] = "* Email unavailable"
      redirect to '/signup'
    else
      flash[:message] = "*Please fill out each field"
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
    user = User.find_by(username: username)
    if user && user.authenticate(password)
    session[:user_id] = user.id
    redirect "/users/#{current_user.user_slug}"
    elsif username.empty? || password.empty?
      flash[:message] = "*Please fill out each field"
    elsif !User.find_by(username: username)
    flash[:message] = "* Username doesn't exist"
    elsif !user.authenticate(password)
    flash[:message] = "* Incorrect password"
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
