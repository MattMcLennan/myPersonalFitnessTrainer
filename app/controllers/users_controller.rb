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

  # def generate_user_info
  #   @user_data = fitbit_weight_goal(current_user)
  #   render :json => @user_data
  # end

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

  # @consumer_key = '10c780512cf30750c716e8523c718155'
  # @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'

  # def fitbit_client(user)
  #   binding.pry
  #   client = Fitgem::Client.new({:consumer_key => @consumer_key,
  #     :consumer_secret => @consumer_secret, :token => user.token,
  #     :secret => user.secret, :user_id => user.uid})

  #   binding.pry
  #   # Reconnects existing user using their credentials
  #   access_token = client.reconnect(user.token, user.secret)
  # end

  # def fitbit_weight_goal(user)
  #   fitbit_client(user).body_fat_goals
  # end

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
