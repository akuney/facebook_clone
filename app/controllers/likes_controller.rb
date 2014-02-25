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
    @like = Like.find(params[:id])
    @like.destroy

    if request.xhr?
      render json: "hi"
    else
      redirect_to :back
    end
  end

  def index

  end
end
