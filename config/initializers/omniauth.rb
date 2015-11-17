Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit,
  :consumer_key => 'fc54884af296cdf89a4227b8c3f705a0',
  :consumer_secret => '7b043f3f227dafcf0c7fb83d1fc33079'
end

# https://github.com/tkgospodinov/omniauth-
