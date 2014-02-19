class LikesController < ApplicationController
  def create
    @like = Like.new(params[:like])
    @like.save!
    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to :back
  end

  def index

  end
end
