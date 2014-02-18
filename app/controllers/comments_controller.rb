class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments_received
  end

  def show
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.save!
    redirect_to user_comments_url(current_user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_comments_url(current_user)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.save!
    redirect_to user_comments_url(current_user)
  end
end
