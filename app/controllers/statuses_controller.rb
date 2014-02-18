class StatusesController < ApplicationController
  def new
    @user = current_user
  end

  def index
    @user = User.find(params[:user_id])
    @statuses = @user.statuses
  end

  def show
  end

  def create
    @status = Status.new(params[:status])
    @status.save!
    redirect_to user_statuses_url(current_user)
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
