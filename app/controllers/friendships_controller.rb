class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(params[:friendship])
    @friendship.save!

    redirect_to :back
  end

  def destroy
    @friendship = Friendship.find(params[:friendship])
    @friendship.destroy
    redirect_to :back
  end

end
