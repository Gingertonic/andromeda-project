class AliensController < ApplicationController

  get "/aliens" do
    erb :'aliens/index'
  end

  get "/aliens/new" do
    erb :'aliens/create_alien'
  end

  get "/aliens/:id" do
    erb :'aliens/show_alien'
  end

  post "/aliens" do
    redirect to "/aliens/<%=@alien.slug%>"
  end

end
