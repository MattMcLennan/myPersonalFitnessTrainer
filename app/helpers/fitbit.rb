
@consumer_key = 'd73fc36ebb2877cb1900ad5b34630227'
@consumer_secret = '7c52a7bec1d9dcabe7e7b0bfab0bde2a'


def fitbit_client(user)
  client = Fitgem::Client.new({:consumer_key => @consumer_key, 
    :consumer_secret => @consumer_secret, :token => user.token, 
    :secret => user.secret, :user_id => user.uid})
end

def generate_user_info
  user = User.find(params[:id])
  render :json => fitbit_client(user).body_weight_goal
end