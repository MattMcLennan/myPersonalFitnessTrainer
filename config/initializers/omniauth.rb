Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, 
  :consumer_key => '8bb7cc93f392e7c8a43e4ef2ab89ea6c', 
  :consumer_secret => 'ffdedac4a0d38cf674ce787f138ba7ef'
end

# https://github.com/tkgospodinov/omniauth-
