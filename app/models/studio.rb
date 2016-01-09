class Studio < ActiveRecord::Base
  has_many :spin_classes
  has_many :users

  def get_current_classes
  end
end
