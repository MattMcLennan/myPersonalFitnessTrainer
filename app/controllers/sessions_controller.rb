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

    @consumer_key = '10c780512cf30750c716e8523c718155'
    @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'

    @client = Fitgem::Client.new({
      :consumer_key => @consumer_key, 
      :consumer_secret => @consumer_secret, 
      :token => @user.token, 
      :secret => @user.secret, 
      :user_id => @user.uid})
    # client.activity_on_date_range(:calories, '2015-07-07', 'today')
    # client.body_weight_goal
    # Need Partner API access for:
      # client.intraday_time_series({resource: :calories ,date: '2015-10-12',  detailLevel:  "1min", startTime: '10:20', endTime: '10:40'})
    # access_token = client.reconnect(@user.token, @user.secret)
    session[:user_id] = @user.id
    redirect_to new_user_path(id: @user.id) 
  end

  def get_user_activities(auth)
    @user.uid = auth["uid"]
    @user.token = auth['credentials'].token
    @user.secret = auth['credentials'].secret

    client = Fitgem::Client.new({
      :consumer_key => @consumer_key, 
      :consumer_secret => @consumer_secret, 
      :token => @user.token, 
      :secret => @user.secret, 
      :user_id => @user.uid})

    access_token = client.reconnect(@user.token, @user.secret)
    client.activity_on_date('today')

  end

  def generate_user_info
    oauth_token =  params[:oauth_token]
    oauth_verifier =  params[:oauth_verifier]
    auth = request.env["omniauth.auth"]
    activities =  get_user_activities(auth)
    render :json => activities
  end

end
