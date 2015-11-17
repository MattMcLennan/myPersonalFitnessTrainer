Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, :consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET']
end

# https://github.com/tkgospodinov/omniauth-
