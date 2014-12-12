$ ->
  $(document)
    .on 'ajax:beforeSend', '#new_post', (e, xhr, settings) ->
      return $(this).find('textarea').val() != ""
    .on 'ajax:success', '#new_post', (e, data, status, xhr) ->
      $(this).find('textarea').val("")
      $('posts').append(xhr.responseText)
      $('.comment_form').hide()
    .on 'ajax:success', '.glyphicon.glyphicon-remove', (e, data, status, xhr) ->
      $(".post[data-id = #{data.id}]").slideUp()
    .on 'click', '.extremum-click', ->
      $('.comment_form').hide()
      id = $(this).data('formId')
      $(".comment_form[data-id = #{id}]").toggle()
    $('.comment_form').hide()
