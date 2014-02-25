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
  $(".likes").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);

    $target.children('.num-likes').eq(0).html(data.num_likes + " likes");
    $target.children('.like-form').eq(0).toggleClass("invisible");
    $target.children('.unlike-button').eq(0).toggleClass("invisible");
  });

  $(".new-reply-form").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget);
    $target.before(data);
  });

  $(".replies").on("ajax:success", ".delete-reply", function(event, data) {
    var $target = $(event.currentTarget).parent().parent();
    console.log($target);
    $target.remove();
  });

  $(".new-status").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget).parent().children('.statuses');
    $target.prepend(data);
  });

  $(".new-comment").on("ajax:success", function(event, data) {
    var $target = $(event.currentTarget).parent().children('.comments');
    $target.prepend(data);
  });



});
