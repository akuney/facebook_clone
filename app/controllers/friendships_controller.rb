class FriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.find(params[:pending_friendship])
    @friendship.save!

    redirect_to :back
  end

  def destroy
    @friendship = Friendship.find(params[:friendship])
    @friendship.destroy
    redirect_to :back
  end

end
