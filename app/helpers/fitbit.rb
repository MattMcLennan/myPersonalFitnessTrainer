@consumer_key = 'f03b54e47ba1660519ced49131fd7ff9'
@consumer_secret = 'a3d5288ecd685c7ee24cacfcdea1a5a3'


def fitbit_client(user)
  client = Fitgem::Client.new({:consumer_key => @consumer_key, 
    :consumer_secret => @consumer_secret, :token => user.token, 
    :secret => user.secret, :user_id => user.uid})
end

def fitbit_weight(user)
  puts fitbit_client(user).body_weight_goal
end

def generate_user_info(user)
  render :json => fitbit_client(user).body_weight_goal
end