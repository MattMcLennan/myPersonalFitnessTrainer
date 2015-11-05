class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "Adios!"
  end

  def failure
    
  end

  def fitbit
    # auth_hash = request.env['omniauth.auth']
    # render :text => auth_hash.inspect

  user = User.from_omniauth(env["omniauth.auth"])
  session[:user_id] = user.id
  redirect_to users_path, notice: "Welcome back, #{user.name}!"
  end
end
