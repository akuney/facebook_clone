class StatusesController < ApplicationController
  def new
    @status = Status.new
    @user = current_user
  end

  def index
    @user = User.find(params[:user_id])
    @statuses = @user.statuses
    @comments = @user.received_comments
  end

  def show
  end

  def create
    @status = Status.new(params[:status])
    @status.save!
    redirect_to user_statuses_url(current_user)
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to user_statuses_url(current_user)
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.update_attributes(params[:status])
    @status.save!
    redirect_to user_statuses_url(current_user)
  end
end
