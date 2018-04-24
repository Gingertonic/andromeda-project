class Helpers

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

end
