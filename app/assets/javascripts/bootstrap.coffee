$ ->
  $.backstretch("/assets/jacques_cartier_bridge.jpg")

  $('[data-gravatar]').each (index, e) ->
    $(e).html($.gravatar($(e).data('gravatar')))