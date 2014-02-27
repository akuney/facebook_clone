class DemoFriendsController < ApplicationController
  def create
    @user = current_user

    Friendship.create!(user_id: @user.id, friend_id: User.find(1).id)
    # Friendship.create!(@user, User.find(2))
  #   PendingFriendship.create!(@user, User.find(4))
  #   PendingFriendship.create!(User.find(5), @user)

    if request.xhr?
      render partial: 'demo_friends/all', locals: {user: @user}
    else
      render json: {hi: 'hi'}
    end
  end
end
