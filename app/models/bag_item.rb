class BagItem < ActiveRecord::Base

  belongs_to :user
  has_many :head

end
