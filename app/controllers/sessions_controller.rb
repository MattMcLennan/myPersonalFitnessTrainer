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
    @consumer_key = '10c780512cf30750c716e8523c718155'
    @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'

    client = Fitgem::Client.new({
      :consumer_key => @consumer_key,
      :consumer_secret => @consumer_secret,
      :token => current_user.token,
      :secret => current_user.secret,
      :user_id => current_user.uid})

    @data = {
      "body_weight_goal" => client.body_weight_goal,
      "body_weight" => client.activity_on_date_range(:weight, '2015-07-07', 'today'),
      "steps" => client.activity_on_date_range(:steps, '2015-07-07', 'today'),
      "distance" => client.activity_on_date_range(:distance, '2015-07-07', 'today'),
      "calories" => client.activity_on_date_range(:calories, '2015-07-07', 'today') 
    }

     # calculates average cals

      get_cals = client.activity_on_date_range(:calories, 1.week.ago.to_date.to_s, "today")
      total_cals = 0
      count = 0

      get_cals["activities-calories"].each do |i|        
        i.each do |key,value|
          if key=="value"
            total_cals += value.to_i
            count += 1
          end  
        end  
      end
      current_user.avg_weekly_cals = total_cals/count.round(-1)
      current_user.save!

    render :json => @data
  end

end




  # config.vm.network :forwarded_port, guest: 3000, host: 1234

