define ['libs/eventbus'], (bus) ->
  load: (query, type, callback) ->
    console.log "query entered: #{query}"

    if @lastRequest and @lastQuery is query 
      @lastRequest.abort() 

    url = "http://ws.spotify.com/search/1/#{type}.json?#{query}"
    
    console.log "GET #{url}"
    
    @lastQuery = query

    @lastRequest = $.ajax
      url: url
    .done (data) -> 
      callback null, data
    .fail (req, err) -> 
      callback err
    .always () =>
      @lastRequest = null 