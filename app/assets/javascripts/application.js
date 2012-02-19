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
//= require jquery-ui
//= require_tree .
//
//

$(document).ready(function() {
  // DIVs as links
  $('.buttons .link').click(function() {
    window.location = $(this).attr("url");
  });


  $('#apply.link').click(function() {
    var params = {
      event_id: $('#submissions #event_id:hidden').val(),
      person: {
        first_name: $('#first_name input').val(),
        last_name: $('#last_name input').val(),
        email: $('#email input').val()
      }
    }
    $.post('/apply', params, function(response) {
      alert("tenks na prijavi")
    });

  });
});
