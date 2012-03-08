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
      "person[first_name]": { required: true },
      "person[last_name]": { required: true },
      "person[email]": { required: true, email: true }
    },
    messages: {
      "person[first_name]": 'Treba nam tvoje ime',
      "person[last_name]": 'Treba nam i prezime',
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

  // show/hide event info
  $('.buttons').click(function() {
    $('.column-container').children().addClass('hidden');
    $('#submissions,#announcement').removeClass('hidden');
  });
  
  $('#next-meetup.button').click(function() { 
    $('.column-container').children().addClass('hidden');
    $('#participants,#talks').removeClass('hidden');
  });

  // write defaults in data elem.
  $('#submissions input:text').each(function() {
    var el = $(this);
    el.data('originalValue', el.val())
  });

  // clear input elements and repopulate if empty
  $('#submissions input:text').focus(function() {
    if (!$(this).data('originalValue')) {
      $(this).data('originalValue', $(this).val());
    }
    if ($(this).val() == $(this).data('originalValue')) {
      $(this).val('');
    }
  }).blur(function(){
    if ($(this).val() == '') {
      $(this).val($(this).data('originalValue'));
    }
  });

  $('#apply-form').submit(function() {
    // clear from default values
    $('#submissions input:text').each(function(i,el) {
      if ($(el).data('originalValue') == $(el).val()) {
        $(el).val('');
      }
    });

    // submit if valid
    if ($('#apply-form').valid()) {
      var params = {
        event_id: $('#submissions #event_id:hidden').val(),
        person: {
          first_name: $('#first_name input').val(),
          last_name: $('#last_name input').val(),
          email: $('#email input').val()
        }
      }

      $.ajax({
        url: '/apply',
        type: 'post',
        data: params,
        dataType: "json",
        success: function(response) {
          console.log(response)
          //$('#submissions').html(response.message);
          $('#messages').removeClass('error').html(response.message)
        },
        error: function(response) {
          console.log(response)
          $('#messages').addClass('error').html(response.responseText);
        }
      });
    } else {
      $('#submissions input:text').each(function(i,el) {
        if ($(el).val() == $(el).data('originalValue')) {
          $(el).val($(el).data('originalValue'));
        }
      });
    }
  });

});
