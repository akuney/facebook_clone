class MessageThreadsController < ApplicationController
  def new
  end

  def index
    @message_threads = current_user.all_message_threads
  end

end
