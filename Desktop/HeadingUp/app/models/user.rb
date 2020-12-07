class User < ActiveRecord::Base

  has_many :bag_item
  has_secure_password
  validates :email, uniqueness:  true


end