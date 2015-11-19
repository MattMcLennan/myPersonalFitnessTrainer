Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '026aedc97131490ed46724dda248ac0e', '5287fa5c08b4271164f201c249a9b899'
end

# https://github.com/tkgospodinov/omniauth-
