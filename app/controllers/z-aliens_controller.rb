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
    @alien.update(name: params[:name], classification: params[:classification], description: params[:description])
    @alien.save
    redirect to "/aliens/#{@alien.slug}"
  end

  post "/aliens" do
    redirect to "/aliens/#{@alien.slug}"
  end

end
