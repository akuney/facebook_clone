class MessageThreadsController < ApplicationController
  def new
  end

  def index
    @message_threads = current_user.all_message_threads
  end

  def create
    @message_thread = MessageThread.new(params[:message_thread])
    @message_thread.save!
    render :index
  end

end
