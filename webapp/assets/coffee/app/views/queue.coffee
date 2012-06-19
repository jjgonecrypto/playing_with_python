define ['text!./queue.html','libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @queue = @options.queue
      @playing = @options.playing

      bus.on 'playing:set', (track) =>
        @queue.append track
        @render()

      @queue.on 'replaced', () => @render() 

    render: ->
      @$el.html _.template(viewTemplate, 
        queue: @queue.toFullJSON()
        playingTrack: @playing.track()?.toJSON()
      )
      @

    playTrack: (evt) ->
      evt.preventDefault()
      track = @queue.findBy @$(evt.target).data("href")
      bus.trigger 'playing:set', track 

    removeTrack: (evt) ->
      evt.preventDefault()
      track = @queue.findBy @$(evt.target).data("href")
      @playing.clear() if @playing.get('track') is track 
      @queue.remove track
      @render()

    events:
      'click .play': 'playTrack'
      'click .remove': 'removeTrack'