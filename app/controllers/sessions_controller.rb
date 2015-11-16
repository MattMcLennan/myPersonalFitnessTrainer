class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def fitbit
    auth = (env["omniauth.auth"])
    @user = User.find_or_initialize_by(uid: auth["uid"])
    @user.provider = auth["provider"]
    @user.uid = auth["uid"]
    @user.name = auth["info"]["full_name"]
    @user.gender = auth["info"]["gender"]
    @user.weight = auth["extra"]["raw_info"]["user"]["weight"]
    @user.token = auth['credentials'].token
    @user.secret = auth['credentials'].secret

    # Calculating the avg cals for the user 
    avg_cals(@user)
    @user.daily_meal = daily_meal(@user)
    @user.save

    session[:user_id] = @user.id
    # redirect_to new_user_path(id: @user.id)
    if current_user.email != nil
      redirect_to users_path
    else
      redirect_to new_user_path(id: @user.id)
    end
  end

  def generate_user_info
    @consumer_key = 'afa236cfde4b752007e5bdfff09fcd51'
    @consumer_secret = '9e232d99682c218ec38ec05a7b010e6d'

    client = Fitgem::Client.new({
      :consumer_key => @consumer_key,
      :consumer_secret => @consumer_secret,
      :token => current_user.token,
      :secret => current_user.secret,
      :user_id => current_user.uid})

    if current_user.updated_at.to_date != Date.current
      current_user.daily_meal = daily_meal(current_user)
    end

    current_user.save!

    @data = {
      "body_weight_goal" => client.body_weight_goal,
      "body_weight" => client.activity_on_date_range(:weight, '2015-07-07', 'today'),
      "steps" => client.activity_on_date_range(:steps, '2015-07-07', 'today'),
      "distance" => client.activity_on_date_range(:distance, '2015-07-07', 'today'),
      "calories" => client.activity_on_date_range(:calories, '2015-07-07', 'today'),
      "meal" => JSON.parse(current_user.daily_meal),
      "user_calorie_goal" => current_user.avg_weekly_cals,
      "user_calorie_intake" => Meal.test_daily(JSON.parse(current_user.daily_meal))

    }

    render :json => @data
  end

  def daily_meal(user)
    user.daily_meal = Meal.algo(user)
  end

  def avg_cals(user)
    @consumer_key = 'afa236cfde4b752007e5bdfff09fcd51'
    @consumer_secret = '9e232d99682c218ec38ec05a7b010e6d'

    client = Fitgem::Client.new({
      :consumer_key => @consumer_key,
      :consumer_secret => @consumer_secret,
      :token => user.token,
      :secret => user.secret,
      :user_id => user.uid}), 
      :user_id => user.uid}), 

    get_cals = client.activity_on_date_range(:calories, 1.week.ago.to_date.to_s, "today")
    user.goal = client.body_weight_goal["goal"]["goalType"]

    total_cals = 0
    count = 0
    i = 0

    # Object returns 8 objects however we only want to look at 7 of them
    # since the 8th object will be calories as of the current date
    # it will not be for the full date
    7.times do
      total_cals += get_cals["activities-calories"][i]["value"].to_i
      count += 1
      i += 1
    end

    if user.goal == "LOSE"
      user.avg_weekly_cals = (total_cals/count).round(-1) - 500 
    else
      user.avg_weekly_cals = (total_cals/count).round(-1) + 500 
    end

  end
end
