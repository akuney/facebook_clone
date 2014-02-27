class DemoFriendsController < ApplicationController
  def create
    @user = current_user

    Friendship.create!(user_id: @user.id, friend_id: User.find(1).id)
    Friendship.create!(user_id: @user.id, friend_id: User.find(2).id)
    PendingFriendship.create!(user_id: @user.id, pending_friend_id: User.find(5).id)
    PendingFriendship.create!(user_id: User.find(6).id, pending_friend_id: @user.id)

    if request.xhr?
      render partial: 'demo_friends/all', locals: {user: @user}
    else
      render json: {hi: 'hi'}
    end
  end
end
