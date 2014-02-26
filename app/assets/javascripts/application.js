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

  $(".photo-info").on("ajax:success", ".people-tagged", function(event, data) {
    var $target = $(event.target);
    var $personTagged = $target.parent().parent();
    var $tagMorePeople =
    $personTagged.parent().parent().children('.tag-more-people');

    $personTagged.remove();
    $tagMorePeople.append(data);
  });

  $(".photo-info").on("ajax:success", ".tag-more-people", function(event, data) {
    var $target = $(event.target);
    var $untaggedFriend = $target.parent();
    var $peopleTagged =
    $untaggedFriend.parent().parent().children('.people-tagged');
    console.log($peopleTagged);

    $untaggedFriend.remove();
    $peopleTagged.append(data);
  });

  // searching

  $(".top-bar").on("ajax:success", ".new-search", function(event, data) {
    var $target = $(event.target);
    var $topBar = $target.parent().parent().parent();
    $topBar.append(data);
  });

  $(".not-friend").on("ajax:success", ".add-friend", function(event, data) {
    var $target = $(event.target);

    var $parent = $target.parent();
    $parent.html("<div class='links'></div>");
    $parent.append(data);
  });

  $(".sent-request").on("ajax:success", ".revoke-request", function(event, data) {
    var $target = $(event.target);
    $target.parent().parent().remove();
  });

  $(".received-request").on("ajax:success", ".accept-form", function(event, data) {
    var $target = $(event.target);
    $target.parent().remove();
  });

  $(".received-request").on("ajax:success", ".reject-request", function(event, data) {
    var $target = $(event.target);
    $target.parent().parent().remove();
  });
});
