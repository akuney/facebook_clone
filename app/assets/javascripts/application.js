// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
  $(".wall").on("ajax:success", ".likes", function(event, data) {
    var $target = $(event.currentTarget);

    $target.children('.num-likes').eq(0).html(data.num_likes + " likes");
    $target.children('.like-form').eq(0).toggleClass("invisible");
    $target.children('.unlike-button').eq(0).toggleClass("invisible");
  });

  $(".photo-comment").on("ajax:success", ".likes", function(event, data) {
    var $target = $(event.currentTarget);

    $target.children('.num-likes').eq(0).html(data.num_likes + " likes");
    $target.children('.like-form').eq(0).toggleClass("invisible");
    $target.children('.unlike-button').eq(0).toggleClass("invisible");
  });


  $(".new-reply-form").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);
    $target.before(data);

    var $textarea = $target.children('.new-reply').eq(0).children('textarea');
    $textarea.val('');
  });

  $(".replies").on("ajax:success", ".delete-reply", function(event, data) {
    var $target = $(event.currentTarget).parent().parent();
    $target.remove();
  });


  $(".new-status").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);
    var $statuses = $target.parent().children('.statuses');
    $statuses.prepend(data);

    var $form = $target.children('form').eq(0)
    var $textarea = $form.children('.textarea').eq(0).children('textarea');
    $textarea.val('');
  });

  $(".new-comment").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);
    var $comments = $target.parent().children('.comments');
    $comments.prepend(data);

    var $form = $target.children('form').eq(0)
    var $textarea = $form.children('.textarea').eq(0).children('textarea');
    $textarea.val('');
  });


  // refactor those previous two at some point?

  $(".people-tagged").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);
    var $personTagged = $target.children('.person-tagged').eq(0);
    $personTagged.remove();

    var $tagMorePeople =
    $target.parent().children('.tag-more-people').eq(0);
    $tagMorePeople.append(data);
  });

  $(".tag-more-people").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);
    var $untaggedFriend = $target.children('.untagged-friend').eq(0);
    $untaggedFriend.remove();

    var $peopleTagged =
    $target.parent().children('.people-tagged').eq(0);
    $peopleTagged.append(data);
  });
});
