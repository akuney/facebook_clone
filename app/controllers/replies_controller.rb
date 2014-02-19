class RepliesController < ApplicationController

  def create
    @reply = Comment.new(params[:comment])
    @comment.save!
    redirect_to user_statuses_url(@comment.recipient)
    # We are on someone else's page, and we want to stay there.
  end


end
