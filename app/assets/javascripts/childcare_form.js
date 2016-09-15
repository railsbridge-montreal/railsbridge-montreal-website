$(function () {
  $(document).on('ready page:load', function() {

    $('.registration-form').on('submit', function(event) {
      event.preventDefault();
      event.stopPropagation();
      validate();
      return false
    });

    $('#add_child_btn').on('click', addChild);

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
      }
    }


  });
});

function addChild() {
  $('#email-form').hide();
  $('#add_children').removeClass('hidden');
  var form = $('.form-template').clone();
  form.removeClass('form-template')
  $('#childcare_email', form).val($('#registrant_email').val());
  $('#add_children .forms').append(form);
}
