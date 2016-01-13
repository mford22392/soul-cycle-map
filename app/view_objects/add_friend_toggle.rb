class AddFriendToggle 
  attr_reader :potential_friend, :current_user

  def initialize(potential_friend, current_user)
    @potential_friend = potential_friend
    @current_user = current_user
  end

  def already_friends?
    if Friendship.find_by(user_id: current_user.id, friend_id: @potential_friend.id)
      'delete_friend'
    else
      'add_friend'
    end
  end

end