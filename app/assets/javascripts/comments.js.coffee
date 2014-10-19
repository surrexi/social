$ ->
  $(document).on 'ajax:success', '#new_comment', (e, data, status, xhr) ->
    $(this).find('textarea').val("");
    $('comments').html(xhr.responseText);
  $(document).on 'ajax:success', '.glyphicon.glyphicon-remove', (e, data, status, xhr) ->
    $("##{data.id}").slideUp();
