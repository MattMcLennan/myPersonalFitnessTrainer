class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user
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
    # raise env["omniauth.auth"].to_yaml
    # puts env["omniauth.auth"].inspect
    auth = (env["omniauth.auth"])
    @user = User.find_or_initialize_by(uid: auth["uid"], provider: 'fitbit')
    @user.provider = auth["provider"]
    @user.uid = auth["uid"]
    @user.name = auth["info"]["full_name"]
    @user.token = auth['credentials'].token
    @user.secret = auth['credentials'].secret
    @user.save
    session[:user_id] = @user.id
    redirect_to new_user_path(id: @user.id) 
  end

end
