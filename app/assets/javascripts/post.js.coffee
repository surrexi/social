$ ->
  $(document)
    .on 'ajax:beforeSend', '#new_post', (e, xhr, settings) ->
      return $(this).find('textarea').val() != ""
    .on 'ajax:success', '#new_post', (e, data, status, xhr) ->
      $(this).find('textarea').val("")
      $('posts').append(xhr.responseText)
    .on 'ajax:success', '.glyphicon.glyphicon-remove', (e, data, status, xhr) ->
      $("#post_#{data.id}").slideUp()
    .on 'click', '.extremum-click', ->
      id = $(this).data('formId')
      $(".comment_form[data-id = #{id}]").toggle()
