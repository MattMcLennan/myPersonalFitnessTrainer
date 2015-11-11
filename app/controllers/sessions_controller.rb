class SessionsController < ApplicationController
  # def create
  #   user = User.find_by(email: params[:email])
  #   if user
  #     session[:user_id] = user.id
  #     redirect_to users_path, notice: "Welcome back, #{user.name}!"
  #   else
  #     flash.now[:alert] = "Log in failed..."
  #     render :new
  #   end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "Adios!"
  end

  def fitbit
    auth = (env["omniauth.auth"])
    @user = User.find_or_initialize_by(uid: auth["uid"], provider: 'fitbit')
    @user.provider = auth["provider"]
    @user.uid = auth["uid"]
    @user.name = auth["info"]["full_name"]
    @user.token = auth['credentials'].token
    @user.secret = auth['credentials'].secret
    @user.save

    @consumer_key = '10c780512cf30750c716e8523c718155'
    @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'

    @client = Fitgem::Client.new({
      :consumer_key => @consumer_key, 
      :consumer_secret => @consumer_secret, 
      :token => @user.token, 
      :secret => @user.secret, 
      :user_id => @user.uid})

    session[:user_id] = @user.id    
      
    redirect_to new_user_path(id: @user.id) 
  end


  def generate_user_info
    @consumer_key = '10c780512cf30750c716e8523c718155'
    @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'
    # client.activity_on_date_range(:steps, '2015-07-07', 'today')
    # client.body_weight_goal
    # Need Partner API access for:
      # client.intraday_time_series({resource: :calories ,date: '2015-10-12',  detailLevel:  "1min", startTime: '10:20', endTime: '10:40'})

    client = Fitgem::Client.new({
      :consumer_key => @consumer_key, 
      :consumer_secret => @consumer_secret, 
      :token => current_user.token, 
      :secret => current_user.secret, 
      :user_id => current_user.uid})

    @data = client.activity_on_date_range(:calories, '2015-07-07', 'today')

    render :json => @data
  end

end
