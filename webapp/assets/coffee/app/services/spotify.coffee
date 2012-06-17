define ['libs/eventbus'], (bus) ->
  load: (query, type, callback) ->
    console.log query

    if @lastRequest
      @lastRequest.abort()
      @lastCallback('new query detected. old aborted.')

    url = "http://ws.spotify.com/search/1/#{type}.json?#{query}"
    
    console.log "GET #{url}"
    
    @lastRequest = $.ajax
      url: url
    .done (data) -> 
      callback null, data
    .fail (req, err) -> 
      callback err

    @lastCallback = callback