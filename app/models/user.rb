class User < ActiveRecord::Base
  has_many :meals
end
