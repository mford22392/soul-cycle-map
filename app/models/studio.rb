class Studio < ActiveRecord::Base
  has_many :spin_classes
  has_many :users
end
