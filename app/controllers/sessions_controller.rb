class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]  
    user = User.lookup(auth["provider"], auth["uid"]) || User.register(auth)
  end
end
