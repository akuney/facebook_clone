class DemoWallsController < ApplicationController
  def create
    Status.create!(
    author_id: current_user.id,
    text: "My name is Jeff Doe, and I am a demo user."
    )

    Like.create!(
    liker_id: 5,
    post_type: "Status",
    post_id: Status.last.id
    )

    Reply.create!(
    author_id: 3,
    parent_type: "Status",
    parent_id: Status.last.id,
    text: "I think you're more than just a demo user, Jeff."
    )

    Like.create!(
    liker_id: current_user.id,
    post_type: "Reply",
    post_id: Reply.last.id
    )

    Reply.create!(
    author_id: current_user.id,
    parent_type: "Status",
    parent_id: Status.last.id,
    text: "Thank you. That means so much to me...more than you know."
    )

    Like.create!(
    liker_id: 3,
    post_type: "Reply",
    post_id: Reply.last.id
    )

    Comment.create!(
    author_id: 1,
    recipient_id: current_user.id,
    text: "Lol, Jeff Doe. What a demo user."
    )

    Like.create!(
    liker_id: 1,
    post_type: "Comment",
    post_id: Comment.last.id
    )

    Status.create!(
    author_id: current_user.id,
    text: ":("
    )

    Reply.create!(
    author_id: 5,
    parent_type: "Status",
    parent_id: Status.last.id,
    text: "What happened, Jeff?"
    )

    Reply.create!(
    author_id: current_user.id,
    parent_type: "Status",
    parent_id: Status.last.id,
    text: "It's extremely private. I don't want to talk about it."
    )

    @statuses = current_user.statuses
    @comments = current_user.received_comments

    redirect_to user_statuses_url(current_user)
    # if request.xhr?
#       render partial: 'demo_walls/wall',
#       locals: {user: current_user, statuses: @statuses, comments: @comments}
#     else
#       render json: {hi: 'hi'}  # recently added
#     end
  end
end
