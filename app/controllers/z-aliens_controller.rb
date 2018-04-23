class AliensController < ApplicationController

  get "/aliens" do
    @aliens = Alien.all
    erb :'aliens/index'
  end

  get "/aliens/new" do
    erb :'aliens/create_alien'
  end

  get "/aliens/:slug" do
    @alien = Alien.find_by_slug(params[:slug])
    erb :'aliens/show_alien'
  end

  get "/aliens/:slug/edit" do
    @alien = Alien.find_by_slug(params[:slug])
    erb :'aliens/edit_alien'
  end

  patch "/aliens/:slug" do
    @alien = Alien.find_by_slug(params[:slug])
    @alien.update(name: params[:name], classification: params[:classification], description: params[:description]) if !params[:name].empty? && !params[:classification].empty? && !params[:name].empty?
    @alien.save
    redirect to "/aliens/#{@alien.slug}"
  end

  post "/aliens" do
    @alien = Alien.create(name: params[:name], classification: params[:classification], description: params[:description]) if !params[:name].empty? && !params[:classification].empty? && !params[:name].empty?
    @planet = Planet.find_or_create_by(name: params[:planet])
    @alien.planet_id = @planet.id
    @alien.save
    redirect to "/aliens/#{@alien.slug}"
  end

  delete "/aliens/:slug" do
    @alien = Alien.find_by_slug(params[:slug])
    @alien.delete
    redirect to "/profile"
  end

end
