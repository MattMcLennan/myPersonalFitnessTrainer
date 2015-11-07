class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "Welcome back, #{user.name.capitalize}!"
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
    # raise env["omniauth.auth"].to_yaml
    # puts env["omniauth.auth"]['credentials'].inspect
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # session[:token] = params.oauth_token
    redirect_to users_path, notice: "Welcome back, #{user.name}!"
  end

end
