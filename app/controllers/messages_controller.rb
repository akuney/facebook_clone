class MessagesController < ApplicationController
  def new
    @message_thread = MessageThread.find(params[:message_thread_id])
  end

  def index
    @message_thread = MessageThread.find(params[:message_thread_id])
  end

  def create
    @message = Message.new(params[:message])
    @message.save!
    redirect_to message_thread_messages(@message.thread_id)
  end
end
