class RepliesController < ApplicationController

  def create
    @reply = Reply.new(params[:reply])
    @reply.save!

    if request.xhr?
      render json: {hi: "hi"}
    else
      redirect_to appropriate_url
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    @reply.update_attributes(params[:reply])
    @reply.save!

    redirect_to appropriate_url
  end

  def destroy
    @reply = Reply.find(params[:id])

    if @reply.parent_type == "Comment"
      @url = user_statuses_url(@reply.parent.recipient)
    elsif @reply.parent_type == "Status"
      @url = user_statuses_url(@reply.parent.author)
    elsif @reply.parent_type == "PhotoComment"
      @url = photo_url(@reply.parent.photo)
    end

    @reply.destroy
    redirect_to @url
  end

  def appropriate_url
    if @reply.parent_type == "Comment"
      return user_statuses_url(@reply.parent.recipient)
    elsif @reply.parent_type == "Status"
      return user_statuses_url(@reply.parent.author)
    elsif @reply.parent_type == "PhotoComment"
      @url = photo_url(@reply.parent.photo)
    else
      return nil
    end
  end
end
