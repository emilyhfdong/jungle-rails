class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :password_digest, presence: true

end
