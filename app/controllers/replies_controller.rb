class RepliesController < ApplicationController

  def create
    @reply = Reply.new(params[:reply])
    @reply.save!

    if @reply.parent_type == "Comment"
      redirect_to user_statuses_url(@reply.parent.recipient)
    elsif @reply.parent_type == "Status"
      redirect_to user_statuses_url(@reply.parent.author)
    end
  end

  def update
  end

  def destroy
  end

end
