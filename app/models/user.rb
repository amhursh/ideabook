class User < ApplicationRecord
  has_many :ideas

  has_secure_password
  
  validates :username, presence: true,
  					   uniqueness: true
  validates :email, presence: true,
  					uniqueness: true
  validates :password, presence: true

  enum role: ["default", "admin"]
end