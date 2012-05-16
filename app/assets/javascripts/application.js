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
//= require plugins
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require ./lib/jquery.validate.js
//= require_tree .

$(document).ready(function() {

  // set up client side form validtion
  $("#apply-form").validate({
    rules: {
      "person[name]": { required: true },
      "person[email]": { required: true, email: true }
    },
    messages: {
      "person[name]": 'Treba nam tvoje ime',
      "person[email]": {
        email: 'Kakav je to email?',
        required: 'Ovo polje nam je najvažnije!'
      }
    }
  });

  // DIVs as links
  $('.link').click(function() {
    window.location = $(this).attr("url");
  });

  $('#apply-form').submit(function(event) {
    event.preventDefault();

    // submit if valid
    if ($(this).valid()) {
      var params = {
        event_id: $('#submissions #event_id:hidden').val(),
        person: {
          name: $('#name input').val(),
          email: $('#email input').val()
        }
      }

      $.ajax({
        url: '/apply',
        type: 'post',
        data: params,
        dataType: "json",
        success: function(response) {
          $('#messages').removeClass('error').addClass('success').html(response.message)
        },
        error: function(response) {
          $('#messages').removeClass('success').addClass('error').html(response.responseText);
        }
      });
    }
  });

});
