class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friendships
    @users = current_user.not_friends
  end

  def create
    @friendship = Friendship.find_or_create_by(user_id: current_user.id, friend_id: params[:friend_id])
    friend_button = render_to_string(partial: "friendships/delete_friend", locals: {current_user: current_user, potential_friend: User.find(params[:friend_id])})
    friend_listing = render_to_string(partial: "users/user_list", locals: {user: @friendship.friend})
    render json: {friend_button: friend_button, current_user: current_user, friend_listing: friend_listing}
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friend = User.find(@friendship.friend_id)
    @friendship.destroy
    friend_button = render_to_string(partial: "friendships/add_friend", locals: {potential_friend: User.find(@friend.id)})
    friend_listing = render_to_string(partial: "users/user_list", locals: {user: @friend})
    render json: {friend_button: friend_button, friend_listing: friend_listing}
  end

  private

  def attendee_params
    params.require(:attendee).permit(:friend_id, :user_id)
  end
end
