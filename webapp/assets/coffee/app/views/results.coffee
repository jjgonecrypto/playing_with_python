define ['text!./results.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @query = undefined
      @entries = @options.entries
      @entries.on "loaded", () => @render()
      bus.on "search:query", (query) => @query = query

    render: ->
      @$el.html _.template viewTemplate, 
        entries: 
          tracks: @entries.tracks.toJSON()
          artists: @entries.artists.toJSON()
          albums: @entries.albums.toJSON()
          query: @query
      @

    playTrack: (evt) ->
      evt.preventDefault()
      href = @$(evt.target).data("href")
      track = @entries.tracks.find (t) -> t.get('href') is href
      
      bus.trigger 'playing:set', track 

    events:
      'click .play': 'playTrack'