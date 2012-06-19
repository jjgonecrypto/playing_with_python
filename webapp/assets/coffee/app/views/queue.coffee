define ['text!./queue.html','libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @queue = @options.queue
      @playing = @options.playing

      bus.on 'playing:set', (track) =>
        @queue.append track
        @render()

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

    events:
      'click .play': 'playTrack'