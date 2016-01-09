class Attendee < ActiveRecord::Base
  # Join table for spin_class and user
  belongs_to :spin_class
  belongs_to :user
end
