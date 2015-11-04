class User < ActiveRecord::Base
  has_secure_password

  has_many :meals
  has_many :exercises

  GOALS = [
    "Weight Gain",
    "Weight Loss"
  ]


end
