class MessagesController < ApplicationController
  def new

  end

  def index
    @message_thread = MessageThread.find(params[:message_thread_id])
  end
end
