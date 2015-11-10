class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in?, only: [:update, :destroy]

  def index
    @users = User.all
    @exercise = Exercise.find_by(user_id: current_user)
  end

  def new
    @user = User.find(params[:id])
  end

  def generate_user_info
    @user_data = fitbit_weight_goal(current_user)
    render :json => @user_data
  end

  def update
    @user = User.new(user_params)
    @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "#{@user.name} welcome!" }
        # session[:user_id] = @user.id
      else
        format.html { render :new, alert: "Signup was not successful." }
      end
    end
  end

  def destroy
    @user.destroy
  end

  @consumer_key = 'd73fc36ebb2877cb1900ad5b34630227'
  @consumer_secret = '7c52a7bec1d9dcabe7e7b0bfab0bde2a'

  def fitbit_client(user)
    client = Fitgem::Client.new({:consumer_key => @consumer_key, 
      :consumer_secret => @consumer_secret, :token => user.token, 
      :secret => user.secret, :user_id => user.uid})
    binding.pry
  end

  def fitbit_weight_goal(user)
    fitbit_client(user).user_id
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        # :name,
        :email
        # :password,
        # :password_confirmation,
        # :goal
      )
    end

end
