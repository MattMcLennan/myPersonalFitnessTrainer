class User < ActiveRecord::Base

  has_many :meals
  has_many :exercises

  EMAIL_RE = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/

  def valid_email
    errors.add(:invalid_email, "Email not valid") unless email.match(EMAIL_RE)
  end

end
