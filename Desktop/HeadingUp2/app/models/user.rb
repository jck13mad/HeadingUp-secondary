class User < ActiveRecord::Base

  has_many :cart_item
  has_many :orders
  has_secure_password
  validates :email, uniqueness:  true


end