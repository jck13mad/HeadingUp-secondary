class User < ActiveRecord::Base

  has_one :bag_item
  has_secure_password
  validates :email, uniqueness:  true


end