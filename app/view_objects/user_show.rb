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
      
      spin_classes = friend.spin_classes.select do |spinclass|
        Date.parse(spinclass.month_and_day) >= Date.today
      end

      (hash[friend] = spin_classes) if (spin_classes.length > 0) 
    end
    hash
  end
  
end