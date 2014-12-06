$ ->
  $(document)
    .on 'ajax:beforeSend', '#new_post', (e, xhr, settings) ->
      return $('#new_post textarea').val() != ""
    .on 'ajax:success', '#new_post', (e, data, status, xhr) ->
      $(this).find('textarea').val("")
      $('posts').append(xhr.responseText)
      $('.extremum-slide').hide()
    .on 'ajax:success', '.glyphicon.glyphicon-remove', (e, data, status, xhr) ->
      $("#post_#{data.id}").slideUp()
    $('.extremum-slide').hide()
    $('.extremum-click').click ->
      $('.extremum-slide').toggle()
