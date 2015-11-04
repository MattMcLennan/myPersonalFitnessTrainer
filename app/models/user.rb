class User < ActiveRecord::Base
  has_many :meals
  has_many :exercises
end
