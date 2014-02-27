class UsersController < ApplicationController
  before_filter :require_signed_in!, :only => [:show]
  before_filter :require_signed_out!, :only => [:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    @user.save!

    sign_in(@user)
    redirect_to new_profile_url
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to new_session_url
  end

end
