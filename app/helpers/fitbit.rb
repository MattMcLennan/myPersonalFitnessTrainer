
# @consumer_key = '10c780512cf30750c716e8523c718155'
# @consumer_secret = '6b53840b9c9113f7a45eb514b5eb6e68'


# def fitbit_client(user)
#   client = Fitgem::Client.new({:consumer_key => @consumer_key, 
#     :consumer_secret => @consumer_secret, :token => user.token, 
#     :secret => user.secret, :user_id => user.uid})
#   binding.pry
# end

# def generate_user_info(user)
#   render :json => fitbit_client(user).body_weight_goal
#   binding.pry
# end