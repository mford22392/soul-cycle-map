class Instructor < ActiveRecord::Base
  has_many :spin_classes
  has_many :users, through: :spin_classes
end
