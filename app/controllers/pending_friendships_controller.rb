class PendingFriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.new(params[:pending_friendship])
    @pending_friendship.save!
    redirect_to user_url(current_user)
  end

  def destroy
    @pending_friendship = PendingFriendship.find(params[:pending_friendship])
    @pending_friendship.destroy
    render :index
  end

  def index
    @user = current_user
    @reqs_sent = current_user.pending_friends
    @reqs_received = current_user.inverse_pending_friends
  end


end
