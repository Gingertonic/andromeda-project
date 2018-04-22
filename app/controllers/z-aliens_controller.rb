class AliensController < ApplicationController

  get "/aliens" do
    @aliens = Alien.all
    erb :'aliens/index'
  end

  get "/aliens/show" do
    erb :'aliens/show_alien'
  end

  get "/aliens/edit" do
    erb :'aliens/edit_alien'
  end

  get "/aliens/new" do
    erb :'aliens/create_alien'
  end

  get "/aliens/:slug" do
    puts params
    @alien = Alien.find_by_slug(params[:slug])
    erb :'aliens/show_alien'
  end

  post "/aliens" do
    redirect to "/aliens/<%=@alien.slug%>"
  end

end
