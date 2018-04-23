class PlanetsController < ApplicationController


  get "/planets" do
    @planets = Planet.all
    erb :'planets/index'
  end

  get "/planets/new" do
    erb :'planets/create_planet'
  end

  get "/planets/:slug" do
    @planet = Planet.find_by_slug(params[:slug])
    erb :'planets/show_planet'
  end

  get "/planets/:slug/edit" do
    @planet = Planet.find_by_slug(params[:slug])
    erb :'planets/edit_planet'
  end

  patch "/planets/:slug" do
    @planet = Planet.find_by_slug(params[:slug])
    @planet.update(name: params[:name], classification: params[:classification], description: params[:description]) if !params[:name].empty? && !params[:classification].empty? && !params[:name].empty?
    @planet.save
    redirect to "/planets/#{@planet.slug}"
  end

  post "/planets" do
    @planet = Planet.create(name: params[:name], classification: params[:classification], description: params[:description]) if !params[:name].empty? && !params[:classification].empty? && !params[:name].empty?
    redirect to "/planets/#{@planet.slug}"
  end

  delete "/planets/:slug" do
    @planet = Planet.find_by_slug(params[:slug])
    @planet.delete
    redirect to "/profile"
  end

end
