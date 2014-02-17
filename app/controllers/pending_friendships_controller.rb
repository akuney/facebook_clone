class PendingFriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.new(params[:pending_friendship])
    @pending_friendship.save!
    redirect_to :back
  end

  def destroy
    @pending_friendship = PendingFriendship.find(params[:pending_friendship])
    @pending_friendship.destroy
    redirect_to :back
  end

  def index
    @user = current_user
    @reqs_sent = PendingFriendship.requests_sent(@user)
    @reqs_received = PendingFriendship.requests_received(@user)
  end


end
