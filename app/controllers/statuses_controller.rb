class StatusesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @statuses = @user.statuses
  end

  def show
  end

  def create
    render :index
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
