class MessageThreadsController < ApplicationController
  def new
  end

  def index
    @message_threads = current_user.all_message_threads
  end

  def create
    @message_thread = MessageThread.new(params[:message_thread])
    @message_thread.save!

    @message = Message.new(params[:message])
    @message.thread_id = @message_thread.id
    @message.save!

    redirect_to message_threads_url
  end

end
