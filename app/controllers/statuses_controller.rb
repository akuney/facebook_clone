class StatusesController < ApplicationController
  def index
    @user = params[:user_id]
    @statuses = @user.statuses
  end

  def show
  end
end
