class FriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.where(params[:pending_friendship]).first
    @user_id = @pending_friendship.user_id
    @friend_id = @pending_friendship.pending_friend_id

    @pending_friendship.destroy

    @friendship = Friendship.new(user_id: @user_id, friend_id: @friend_id)
    @friendship.save!

    if request.xhr?
      render json: {hi: 'hi'}
    else
      redirect_to pending_friendships_url
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to pending_friendships_url
  end

  def index
    @user = User.find(params[:user_id])
  end

end
