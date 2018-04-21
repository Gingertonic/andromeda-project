class PlanetsController < ApplicationController


  get "/planets" do
    erb :'planets/index'
  end

  get "/planets/new" do
    erb :'planets/create_planet'
  end

  get "/planets/:id" do
    erb :'planets/show_planet'
  end

  post "/planets" do
    redirect to "/planets/<%=@planet.slug%>"
  end

end
