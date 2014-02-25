class LikesController < ApplicationController
  def create
    @like = Like.new(params[:like])
    @like.save!

    @post = @like.post.class.find(@like.post.id)

    if request.xhr?
      render json: {post: @post, num_likes: @post.num_likes}
    else
      redirect_to :back
    end
  end

  def destroy
    @like = Like.find_by_liker_and_post(current_user, params[:status_id], params[:id]) ||
    Like.find_by_liker_and_post(current_user, params[:comment_id], params[:id]) ||
    Like.find_by_liker_and_post(current_user, params[:reply_id], params[:id]) ||
    Like.find_by_liker_and_post(current_user, params[:photo_comment_id], params[:id])
    # As per tommy's suggestion, 'id' here is the post type

    if @like
      @post = @like.post.class.find(@like.post.id)
      @like.delete

      if request.xhr?
        render json: {post: @post, num_likes: @post.num_likes}
      else
        redirect_to :back
      end
    else
      render json: "error"
    end
  end

  def index

  end
end
