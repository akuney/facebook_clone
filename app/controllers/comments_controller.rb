class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @comments = @user.received_comments
  end

  def show
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.save!

    if request.xhr?
      render partial: 'comments/show', locals: {:comment => @comment}
    else
      redirect_to user_statuses_url(@comment.recipient)
    end
    # We are on someone else's page, and we want to stay there.
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recipient = @comment.recipient
    @comment.destroy
    redirect_to user_statuses_url(@recipient)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @likes = @comment.likes

    @comment.update_attributes(params[:comment])
    @comment.likes = @likes

    @comment.save!
    redirect_to user_statuses_url(@comment.recipient)
  end
end
