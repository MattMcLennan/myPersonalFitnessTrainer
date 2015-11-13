class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
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

    if current_user.updated_at == current_user.created_at
      meal = JSON.parse(daily_meal)
    elsif current_user.updated_at.to_date != Date.current
      meal = JSON.parse(daily_meal)
    end

    @data = {
      "body_weight" => client.data_by_time_range('/body/weight', {:base_date => "2015-07-07", :end_date => "today"}),
      "steps" => client.data_by_time_range('/activities/log/steps', {:base_date => "2015-07-07", :end_date => "today"}),
      "distance" => client.data_by_time_range('/activities/log/distance', {:base_date => "2015-07-07", :end_date => "today"}),
      "calories" => client.data_by_time_range('/activities/log/calories', {:base_date => "2015-07-07", :end_date => "today"}),
      "meal" => meal
    }

    current_user.save!
    render :json => @data
  end

  def daily_meal
    current_user.daily_meal = Meal.algo
  end

end
