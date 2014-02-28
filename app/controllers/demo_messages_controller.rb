class DemoMessagesController < ApplicationController
  def create

    MessageThread.create!(
    creator_id: 1,
    title: "A message thread for everybody!",
    recipient_ids: [2,3,5,current_user.id])

    Message.create!(
    author_id: 1,
    message_thread_id: MessageThread.last.id,
    text: "This is everybody, right?"
    )

    Message.create!(
    author_id: 5,
    message_thread_id: MessageThread.last.id,
    text: "Not quite...poor Jill Doe seems to get left out of everything in this demo!"
    )

    Message.create!(
    author_id: 1,
    message_thread_id: MessageThread.last.id,
    text: "You know, you're right! Why is that?"
    )

    Message.create!(
    author_id: 5,
    message_thread_id: MessageThread.last.id,
    text: "Weird stuff happening on localhost, that's why."
    )

    MessageThread.create!(
    creator_id: 3,
    title: "A message thread for Jeff Doe only.",
    recipient_ids: [current_user.id])

    Message.create!(
    author_id: 3,
    text: "PLEASE DO NOT SHARE",
    message_thread_id: MessageThread.last.id
    )

    if request.xhr?
      render partial: 'demo_messages/message_threads',
      locals: {message_threads: current_user.all_message_threads}
    else
    end
  end
end
