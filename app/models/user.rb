class User < ActiveRecord::Base

  has_many :meals
  has_many :exercises

  GOALS = [
    "Weight Gain",
    "Weight Loss"
  ]

  EMAIL_RE = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  validate :valid_email

  def valid_email
    errors.add(:invalid_email, "Email not valid") unless email.match(EMAIL_RE)
  end

  def self.from_omniauth(auth)
    where(auth.slice("user.provider", "user.uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["full_name"]
      user.token = auth['credentials'].token
      user.secret = auth['credentials'].secret
    end
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["full_name"]
    end
  end

end
