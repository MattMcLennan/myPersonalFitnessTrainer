class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in?, only: [:update, :destroy]

  def index
    @users = User.all
    @exercises = Exercise.find_by(user_id: current_user)
  end

  def new
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)
    @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "#{@user.name} welcome!" }
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
