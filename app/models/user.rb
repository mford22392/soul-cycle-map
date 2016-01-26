class User < ActiveRecord::Base
  has_many :attendees
  has_many :spin_classes, through: :attendees

  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => "User"
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, :source => :user
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid).permit!).first_or_create.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def spin_classes_by_date
    spin_classes = self.spin_classes
    spin_classes.sort_by do |spin_class|
      Date.parse(spin_class.month_and_day)
    end
  end

  def not_friends
    friend_ids = self.friends.pluck(:id)
    User.where.not(id: (friend_ids << self.id))
  end
end
