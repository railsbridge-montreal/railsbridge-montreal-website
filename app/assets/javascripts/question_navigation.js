function goForward(current_fs, next_fs) {
  var current_fs, next_fs, previous_fs; //fieldsets
  var left, opacity, scale; //fieldset properties which we will animate
  var animating; //flag to prevent quick multi-click glitches

  if(animating) return false;
  animating = true;
  current_fs.fadeOut('slow', function() {
    next_fs.removeClass('hidden-fieldset');
    next_fs.fadeIn('slow');
  });
}

function openQuestions(){
  var newHeight = $(window).height() - $('header').height();
  $('.banner').animate(
    { height: newHeight },
    300,
    function() {
      $('.banner .registration-row').fadeOut("slow", function() {
        var question = $('#question-1')
        question.removeClass('hidden-fieldset');
        question.fadeIn("slow");
      })
    }
  )
}

function answerQuestion(event) {
  var target_value = event.target.value;
  var current_field_set = $(event.target).parent().parent().parent()
  var question = current_field_set[0].id;
  if(event.target.value == "yes") {
    goForward(current_field_set, current_field_set.next());
  }
  else {
    if(question === 'question-1' || question === 'question-2' || question === 'question-3') {
      goForward(current_field_set, $('#question-4'))
    }
    else {
      goForward(current_field_set, current_field_set.next());
    }
  }
}

function addNameAndEmailToNewForm() {
  var name = $('#registrant_name')[0].value;
  var email = $('#registrant_email')[0].value;
  $('#registrant_hidden_name')[0].value = name;
  $('#registrant_hidden_email')[0].value = email;
  console.log(name + " " + email);
}

function validate() {
 $('.registration-form .registration-message').remove();
  var name = $('#registrant_name')[0].value;
  var email = $('#registrant_email')[0].value;

  if (name.length < 1) {
    $('#registrant_name').addClass('has-error');
    $('.registration-form').append("<div class='registration-message'>Please enter your name</div>");
  }
  else if (!(/\S+@\S+\.\S+/.test(email))) {
    $('#registrant_email').addClass('has-error');
  $('.registration-form').append("<div class='registration-message'>Please enter your email</div>");
  }
  else {
    addNameAndEmailToNewForm();
    openQuestions();
  }
}

$(document).ready(function() {
  $('.registration-form').on('submit', function() {
    event.preventDefault();
    event.stopPropagation();
    validate();
  });

  $('.questions-form input[type="radio"]').click(function(event) {
    answerQuestion(event);
  });
});

