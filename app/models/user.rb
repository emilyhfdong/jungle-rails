class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :password, length: {minimum: 5}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, :last_name, :password_digest, presence: true

end
