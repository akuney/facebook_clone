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

  // liking and unliking happens dynamically


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

  // addition and deletion of replies


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

  // statuses and comments appear immediately




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


  //tagging and untagging photos


  $(".top-bar").on("ajax:success", ".new-search", function(event, data) {
    var $target = $(event.target);
    var $topBar = $target.parent().parent().parent();
    $topBar.append(data);
  });

  //searching


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

  $('.friend').on("ajax:success", ".unfriend", function(event, data) {
    var $target = $(event.target);
    $target.closest('.friend').remove();
  });

  // sending, accepting, and rejecting friend requests, and unfriending


  $('.message-threads').on("ajax:success", ".create-thread", function(event, data) {
    var $target = $(event.target);
    var $messageThreads = $target.closest('.message-threads');
    var $link = $target.parent();

    $link.remove();
    console.log(data);
    $messageThreads.append(data);
  });

  // new message thread appears on the page


  $('.sign-up').on("ajax:success", ".demo-sign-in", function(event, data) {
    var $target = $(event.target);
    var $signIn = $target.parent().parent();

    var $email = $signIn.children('form').children('.email');
    var $password = $signIn.children('form').children('.password');

    $email.children().eq(1).attr('value', 'demo@demo.demo');
    $password.children().eq(1).attr('value', 'password');
  });

  $('.new-profile').on("ajax:success", ".demo-profile", function(event, data) {
    var $target = $(event.target);
    var $newProfile = $target.parent().parent();

    $newProfile.find(".first-name").find("input").attr('value', 'Jeff');
    $newProfile.find(".last-name").find("input").attr('value', 'Doe');

    $newProfile.find(".month").find('option').eq(1).attr('selected', true);
    $newProfile.find(".day").find('option').eq(2).attr('selected', true);
    $newProfile.find(".year").find('option').eq(10).attr('selected', true);

    $newProfile.find(".gender").find('option').eq(2).attr('selected', true);

    $newProfile.find(".job").find("input").attr('value', 'Being a Demo User');
    $newProfile.find(".employer").find("input").attr('value', 'Demos, Inc.');

    $newProfile.find(".current-city").find("input").attr('value', 'Demo City, USA');
    $newProfile.find(".home-city").find("input").attr('value', 'Demo City, Canada');

    $newProfile.find(".relationship-status").find("option").eq(2).attr('selected', true);
    $newProfile.find(".interested-in").find("option").eq(2).attr('selected', true);

    $newProfile.find(".url").find("input").attr('value', 'http://4.bp.blogspot.com/-w1HZpMGIl5c/TvSbvmpzgeI/AAAAAAAAFzw/JZtvOCZJBFk/s400/0511-1007-0820-1338_Lost_confused_man_clipart_image.jpg');

    $newProfile.find(".about-me").find("textarea").append("I'm Jeff Doe, you all know me!");
  });

  $('.friends-index').on("ajax:success", ".demo-friend", function(event, data) {
    var $target = $(event.target);
    $target.parent().parent().html(data);
  });

  $('.new-photo').on("ajax:success", ".demo-photo-form", function(event, data) {
    var $target = $(event.target);
    var $newPhotoForm = $target.closest('form');
    $newPhotoForm.find('.url').find('input').attr('value', 'http://davidsmallbooks.com/images/david_small.jpg');
    $newPhotoForm.find('.new-photo-comment').find('textarea').append('One of the all time great photos');
  });

  $('.message-threads').on("ajax:success", ".demo-messages", function(event, data) {
    var $target = $(event.target);
    $target.parent().parent().html(data);
  });

  // everything above involves the demo user


});
