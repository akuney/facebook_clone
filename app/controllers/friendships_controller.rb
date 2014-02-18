class FriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.where(params[:pending_friendship]).first
    @user_id = @pending_friendship.user_id
    @friend_id = @pending_friendship.pending_friend_id

    @pending_friendship.destroy

    @friendship = Friendship.new(user_id: @user_id, friend_id: @friend_id)
    @friendship.save!

    redirect_to pending_friendships_url
  end

  def destroy
    @friendship = Friendship.find(params[:friendship])
    @friendship.destroy
    redirect_to pending_friendships_url
  end

  def index
    if (params[:user_id])
      @user = params[:user_id]
    else
      @user = current_user

    end
  end

end
