$ ->
  $(document)
    .on 'ajax:beforeSend', '#new_comment', (e, xhr, settings) ->
      return $('#new_comment textarea').val() != ""
    .on 'ajax:success', '#new_comment', (e, data, status, xhr) ->
      $(this).find('textarea').val("")
      $('comments').html(xhr.responseText)
    .on 'ajax:success', '.glyphicon.glyphicon-remove', (e, data, status, xhr) ->
      $("##{data.id}").slideUp()
