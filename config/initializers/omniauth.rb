Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '10c780512cf30750c716e8523c718155', '6b53840b9c9113f7a45eb514b5eb6e68'
end

# https://github.com/tkgospodinov/omniauth-

