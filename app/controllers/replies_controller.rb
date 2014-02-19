class RepliesController < ApplicationController

  def create
    @reply = Comment.new(params[:comment])
    @reply.save!

    if @reply.parent_type == "Comment"
      redirect_to user_statuses_url(@reply.parent.recipient)
    elsif @reply.parent_type == "Status"
      redirect_to user_statuses_url(@reply.parent.author)
    end
  end


end
