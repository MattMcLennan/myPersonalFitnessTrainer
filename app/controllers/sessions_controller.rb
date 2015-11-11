class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def fitbit
    auth = (env["omniauth.auth"])
    binding.pry
    @user = User.find_or_initialize_by(uid: auth["uid"], provider: 'fitbit')
    @user.provider = auth["provider"]
    @user.uid = auth["uid"]
    @user.name = auth["info"]["full_name"]
    @user.gender = auth["info"]["gender"]
    @user.weight = auth["extra"]["raw_info"]["user"]["weight"]
    @user.token = auth['credentials'].token
    @user.secret = auth['credentials'].secret
    @user.save

    session[:user_id] = @user.id

    redirect_to new_user_path(id: @user.id)
  end

  def generate_user_info
    @consumer_key = '10c780512cf30750c716e8523c718155'
    @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'

    client = Fitgem::Client.new({
      :consumer_key => @consumer_key,
      :consumer_secret => @consumer_secret,
      :token => current_user.token,
      :secret => current_user.secret,
      :user_id => current_user.uid})

    @data = {
      "average_calories" => client.data_by_time_range('/activities/log/calories', {:base_date => 1.week.ago.to_date.to_s, :end_date => "today"}),
      "body_weight_goal" => client.body_weight_goal,
      "body_weight" => client.data_by_time_range('/body/weight', {:base_date => "2015-07-07", :end_date => "today"}),
      "steps" => client.data_by_time_range('/activities/log/steps', {:base_date => "2015-07-07", :end_date => "today"}),
      "distance" => client.data_by_time_range('/activities/log/distance', {:base_date => "2015-07-07", :end_date => "today"}),
      "calories" => client.data_by_time_range('/activities/log/calories', {:base_date => "2015-07-07", :end_date => "today"})

    }
      # client.activity_on_date_range(:calories, '2015-07-07', 'today') gets total calories out per day
      # client.activity_on_date_range(:steps, '2015-07-07', 'today')  gets total steps out per day
    
    render :json => @data
  end

end
