class UserShow

  def initialize(current_user)
    @current_user = current_user
  end

  def has_friends?
    if @current_user.friends.length == 0
      "You don't have any friends yet :("
    end
  end

  def friends_classes
    hash = @current_user.friends.each_with_object({}) do |friend, hash|
      hash[friend] = friend.spin_classes
    end
    hash
  end
  
end