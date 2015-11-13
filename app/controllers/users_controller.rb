class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in?, only: [:update, :destroy]

  def index
    if !current_user
      redirect_to root_path, alert: "Log in first!"
    else
      @users = User.all
      @exercise = Exercise.find_by(user_id: current_user)
    end
  end

  def new
     @user = User.find(params[:id])

    # if !current_user
    #   redirect_to root_path, alert: "Log in first!"
    # else
    #   @user = User.find(params[:id])
    # end
  end

  def update
    @user.update(user_params)
    @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
      else
        format.html { render :new, alert: "Signup was not successful." }
      end
    end
  end

  def destroy
    @user.destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :email
      )
    end

end
