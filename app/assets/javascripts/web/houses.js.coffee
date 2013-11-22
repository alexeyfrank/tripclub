(($) ->
  $modal = $ '#house-booking-modal'

  $('.show-booking-modal-btn').click (e) ->
    $.get(this.href).then (html) ->
      $modal.html(html)
      $modal.easyModal().trigger('openModal')

    e.preventDefault()

  $modal.on 'click', '.btn-submit', (e)->
    $form = $modal.find('form')
    $.post $form.attr('action'), $form.serialize(), (resp) ->
      $modal.html(resp)

    e.preventDefault()


)(jQuery);
