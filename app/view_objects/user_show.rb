class UserShow

  def initialize(user)
    @user = user
  end

  def has_friends?
    if @user.friends.length == 0
      "No friends yet :("
    end
  end

  def friends_classes
    hash = @user.friends.each_with_object({}) do |friend, hash|
      hash[friend] = friend.spin_classes
    end
    hash
  end
  
end