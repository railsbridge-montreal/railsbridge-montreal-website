function goForward(current_fs, next_fs) {
  var current_fs, next_fs, previous_fs; //fieldsets
  var left, opacity, scale; //fieldset properties which we will animate
  var animating; //flag to prevent quick multi-click glitches

  $('input[type="radio"]', current_fs).unbind("click");
  current_fs.fadeOut('slow').promise().done(function() {
    next_fs.removeClass('hidden-fieldset');
    next_fs.fadeIn('slow');
  });
}

function openQuestions(){
  $('html, body').animate({ scrollTop: 0 }, 'slow');
  var newHeight = $(window).height() - $('header').height();
  $('.banner').animate(
    { height: newHeight },
    300,
    function() {
      $('.banner .registration-row').fadeOut("slow").promise().done(function() {
        $('#question-1').removeClass('hidden-fieldset').fadeIn("slow");
      })
    }
  )
}

function answerQuestion(event) {
  var target_value = event.target.value;
  var current_field_set = $(event.target).closest('fieldset');
  var question = current_field_set.attr('id');
  if(event.target.value == true) {
    goForward(current_field_set, current_field_set.next());
  }
  else {
    if(question === 'question-1' || question === 'question-2') {
      goForward(current_field_set, $('#question-3'));
    }
    else {
      goForward(current_field_set, current_field_set.next());
    }
  }
}

function addUserDataToNewForm() {
  var name = $('#registrant_name')[0].value;
  var email = $('#registrant_email')[0].value;
  var waitlisted = $('#registrant_waitlisted')[0].value;
  $('#registrant_hidden_name')[0].value = name;
  $('#registrant_hidden_email')[0].value = email;
  $('#registrant_hidden_waitlisted')[0].value = waitlisted;
}

function validate() {
 $('.registration-form .registration-message').remove();
  var name = $('#registrant_name')[0].value;
  var email = $('#registrant_email')[0].value;

  if (name.length < 1) {
    $('#registrant_name').addClass('has-error');
    $('.registration-form').append("<div class='registration-message'>"+$('#registrant_name').data('errormsg')+"</div>");
  }
  else if (!(/\S+@\S+\.\S+/.test(email))) {
    $('#registrant_email').addClass('has-error');
  $('.registration-form').append("<div class='registration-message'>"+$('#registrant_email').data('errormsg')+"</div>");
  }
  else {
    addUserDataToNewForm();
    openQuestions();
  }
}

allowCancellation = function () {
    $('#name').show();
    $('#cancel').show();
};

$(document).on('ready page:load', function() {

  $('.registration-form').on('submit', function(event) {
    event.preventDefault();
    event.stopPropagation();
    validate();
    return false
  });

  $('#cancel').on('click', function(e) {
      if(window.confirm($(this).data('confirmation'))) {
          $.ajax({
            type: 'post',
            data: {
              email: $('#registrant_email').val(),
              _method: 'delete'
            },
            url: $(this).attr('href')
          });
      }
    e.preventDefault()
  });

  $('.questions-form input[type="radio"]').click(function(event) {
    answerQuestion(event);
  });
});

