class SpinClass < ActiveRecord::Base
  has_many :attendees
  has_many :users, through: :attendees
  belongs_to :studio
  belongs_to :instructor

  def start_time
    Date.parse(self.month_and_day)
  end
end
