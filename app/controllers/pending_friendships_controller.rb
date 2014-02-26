class PendingFriendshipsController < ApplicationController
  def create
    @pending_friendship = PendingFriendship.new(params[:pending_friendship])
    @pending_friendship.save!

    if request.xhr?
      render partial: 'helpers/not_friend/requested', locals: {user: User.find(@pending_friendship.pending_friend_id)}
    else
      redirect_to user_url(current_user)
    end
  end

  def destroy
    @pending_friendship = PendingFriendship.find(params[:id])
    @pending_friendship.destroy

    if request.xhr?
      render json: {hi: 'hi'}
    else
      redirect_to pending_friendships_url
    end
  end

  def index
    @user = current_user
    @reqs_sent = current_user.pending_friendships
    @reqs_received = current_user.inverse_pending_friendships
  end


end
