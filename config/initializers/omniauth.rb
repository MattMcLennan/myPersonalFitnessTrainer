Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '518847149f7153f988aca36e965bdc82', '9064980d0beaec6a3e8dee0416a28629'
end

# https://github.com/tkgospodinov/omniauth-
