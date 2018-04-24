class PlanetsController < ApplicationController

  get "/planets" do
    if logged_in?
      @planets = []
      Planet.all.each do |planet|
        if planet.user_id == user_id
          @planets << planet end
        end
      erb :'planets/index'
    else
      redirect to "/"
    end
  end

  get "/planets/new" do
    if logged_in?
      erb :'planets/create_planet'
    else
      redirect to "/"
    end
  end


  get "/planets/:slug" do
    if logged_in?
      @planet = Planet.find_by_slug(params[:slug])
      erb :'planets/show_planet'
    else
      redirect to "/"
    end
  end

  get "/planets/:slug/edit" do
    if logged_in?
      @planet = Planet.find_by_slug(params[:slug])
      erb :'planets/edit_planet'
    else
      redirect to "/"
    end
  end

  patch "/planets/:slug" do
    if logged_in?
      if !params[:name].empty? && !params[:classification].empty? && !params[:description].empty?
        @planet = Planet.find_by_slug(params[:slug])
        @planet.update(name: params[:name], classification: params[:classification], description: params[:description])
        @planet.save
        redirect to "/planets/#{@planet.slug}"
      else
        flash[:message] = "*Please fill out all fields"
      end
        @planet = Planet.find_by_slug(params[:slug])
        redirect to "/planets/#{@planet.slug}/edit"
    else
      redirect to "/"
    end
  end

  post "/planets" do
    if logged_in?
      if Planet.find_by(name: name)
        flash[:message] = "*Planet already exists"
      elsif !name.empty? && !classification.empty? && !description.empty?
        @planet = Planet.create(name: name, classification: classification, description: description, user_id: user_id)
        redirect to "/planets/#{@planet.slug}"
      else
        flash[:message] = "*Please fill out all fields"
      end
        redirect to "/planets/new"
      else
        redirect to "/"
      end
  end



  delete "/planets/:slug" do
    if logged_in?
      @planet = Planet.find_by_slug(params[:slug])
      @planet.delete
      redirect to "/profile"
    else
      redirect to "/"
    end
  end

end
