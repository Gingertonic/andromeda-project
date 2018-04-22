class PlanetsController < ApplicationController

  get "/planets/edit" do
    erb :'planets/edit_planet'
  end

  get "/planets" do
    @planets = Planet.all
    erb :'planets/index'
  end

  get "/planets/new" do
    erb :'planets/create_planet'
  end

  get "/planets/:id" do
    erb :'planets/show_planet'
  end

  post "/planets" do
    # redirect to "/planets/<%=@planet.slug%>"
  end

end
