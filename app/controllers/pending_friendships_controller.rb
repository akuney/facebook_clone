class PendingFriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.new(params[:pending_friendship])
    @pending_friendship.save!
    redirect_to user_url(current_user)
  end

  def destroy
    @pending_friendship = PendingFriendship.find(params[:id])
    @pending_friendship.destroy
    redirect_to pending_friendships_url
  end

  def index
    @user = current_user
    @reqs_sent = current_user.pending_friendships
    @reqs_received = current_user.inverse_pending_friendships
  end


end
