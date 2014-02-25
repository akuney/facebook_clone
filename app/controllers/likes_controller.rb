class LikesController < ApplicationController
  def create
    @like = Like.new(params[:like])
    @like.save!


    if request.xhr?
      render json: {post: @like.post}
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
