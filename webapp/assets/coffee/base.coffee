$ ->
  playing = undefined 
  lastRequest = undefined

  $('.spotify-lookup').live 'keyup', (evt) ->
    
    if $(evt.target).val().length > 2 
      query = $(evt.target).serialize()
    
      #todo: cancel last request
      startLoading()

      lastRequest.abort() if lastRequest

      lastRequest = $.ajax
        url: 'http://ws.spotify.com/search/1/track.json?' + query

      .done (data) ->
        playSong(data.tracks[0].href) unless !data.tracks.length
        stopLoading()

      .fail (req, err) ->
        stopLoading()

  startLoading = () ->
    $('.loading').show()

  stopLoading = () ->
    $('.loading').hide()

  playSong = (trackId) ->
    return if playing is trackId
    $('.play-controls').html "<iframe src='https://embed.spotify.com/?uri=#{trackId}' frameborder='0' allowtransparency='true'></iframe>"
    playing = trackId
    