require 'rails_helper'

RSpec.describe "/users_routes" do
  it "routes to /users" do
    expect(post '/users').to route_to(controller:"users", action:"create")
  end

  it "routes to post /login" do
    expect(post '/login').to route_to(controller:'sessions', action:"login")
  end

  it "routes to post /login" do
    expect(get '/auto_login').to route_to(controller:'sessions', action:"auto_login")
  end

  
end