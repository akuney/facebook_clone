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

    @statuses = current_user.statuses
    @comments = current_user.received_comments

    if request.xhr?
      render partial: 'demo_walls/wall',
      locals: {user: current_user, statuses: @statuses, comments: @comments}
    else
    end
  end
end
