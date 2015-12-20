class SpinClass < ActiveRecord::Base
  has_many :users
  belongs_to :studio
end
