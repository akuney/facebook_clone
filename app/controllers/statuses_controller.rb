class StatusesController < ApplicationController
  def new
    @status = Status.new
    @user = current_user
  end

  def index
    @user = User.find(params[:user_id])

    if current_user.all_friends.include?(@user) || current_user == @user
      @statuses = @user.statuses
      @comments = @user.received_comments
    else
      @statuses = []
      @comments = []
    end
  end

  def show
  end

  def create
    @status = Status.new(params[:status])
    @status.save!

    if request.xhr?
      render partial: 'statuses/show', locals: {:status => @status}
    else
      redirect_to user_statuses_url(current_user)
    end
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
    @likes = @status.likes

    @status.update_attributes(params[:status])
    @status.likes = @likes

    @status.save!
    redirect_to user_statuses_url(current_user)
  end
end
