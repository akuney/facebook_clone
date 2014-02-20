class MessageThreadsController < ApplicationController
  def new
    if params[:user_id]
      @current_friend = User.find(params[:user_id])
    else
      @current_friend = nil
    end
  end

  def index
    @message_threads = current_user.all_message_threads
  end

  def create
    @message_thread = MessageThread.new(params[:message_thread])
    @message_thread.save!

    @message = Message.new(params[:message])
    @message.message_thread_id = @message_thread.id
    @message.save!

    redirect_to message_threads_url
  end

  def destroy
    @message_thread = MessageThread.find(params[:id])
    @message_thread.destroy
    redirect_to message_threads_url
  end

end
