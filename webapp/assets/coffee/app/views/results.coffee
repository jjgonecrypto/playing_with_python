define ['text!./results.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @entries = @options.entries
      @entries.on "loaded", (evt) =>
        @render()

    render: ->
      @$el.html _.template(viewTemplate, {tracks: @entries.tracks.toJSON()})
      @

    playTrack: (evt) ->
      evt.preventDefault()
      href = @$(evt.target).data("href")
      track = @entries.tracks.find (t) -> t.get('href') is href
      
      bus.trigger 'playing:set', track 

    events:
      'click .play': 'playTrack'