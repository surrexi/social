$ ->
  $(document)
    .on 'ajax:success', '.vote_link', (e, data, status, xhr) ->
      $('.badge').text(data.count)
