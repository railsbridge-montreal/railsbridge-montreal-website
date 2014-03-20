function goForward(current_fs, next_fs){
  var current_fs, next_fs, previous_fs; //fieldsets
  var left, opacity, scale; //fieldset properties which we will animate
  var animating; //flag to prevent quick multi-click glitches

  if(animating) return false;
  animating = true;
  next_fs.show();
  next_fs.removeClass('hidden-fieldset');
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      //as the opacity of current_fs reduces to 0 - stored in "now"
      //1. scale current_fs down to 80%
      scale = 1 - (1 - now) * 0.2;
      //2. bring next_fs from the right(50%)
      left = (now * 50)+"%";
      //3. increase opacity of next_fs to 1 as it moves in
      opacity = 1 - now;
      current_fs.css({'transform': 'scale('+scale+')'});
      next_fs.css({'left': left, 'opacity': opacity});
    },
    duration: 800,
    complete: function(){
      current_fs.hide();
      animating = false;
    },
    //this comes from the custom easing plugin
    easing: 'easeInOutBack'
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
  var name = $('#registrant_email')[0].value
  var email = $('#registrant_name')[0].value
  $('#registrant_hidden_name')[0].value = name
  $('#registrant_hidden_email')[0].value = email
}

$(document).ready(function() {
  $('.registration-form').on('submit', function() {
    event.preventDefault();
    event.stopPropagation();
    addNameAndEmailToNewForm();
    openQuestions();
  });

  $('.questions-form input[type="radio"]').click(function(event) {
    answerQuestion(event);
  });
});

