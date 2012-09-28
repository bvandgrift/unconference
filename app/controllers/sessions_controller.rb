class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]  
    @current_user = User.lookup(auth) || User.register(auth)
    session[:user_id] = @current_user  

    redirect_to root_url, :notice => "You've been signed in using #{auth['provider']}" 
  end
end
