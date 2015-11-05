Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, 'f03b54e47ba1660519ced49131fd7ff9', 'a3d5288ecd685c7ee24cacfcdea1a5a3'
end

# https://github.com/tkgospodinov/omniauth-fitbit