$ ->
  $(document)
    .on 'ajax:beforeSend', '#new_comment', (e, xhr, settings) ->
      return $(this).find('textarea').val() != ""
    .on 'ajax:success', '#new_comment', (e, data, status, xhr) ->
      $(this).find('textarea').val("")
      id = $(this).data('objectId')
      $(".comments[data-id = #{id}]").append(xhr.responseText)
    .on 'ajax:success', '.glyphicon.glyphicon-remove', (e, data, status, xhr) ->
      $(".comment[data-id = #{data.id}]").slideUp()
