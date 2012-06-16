define ['text!./player.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @playing = false
      @track = undefined
      @entries = @options.entries
      bus.on 'player:play', (trackHref) =>
        return if @track?.get('href') is trackHref
        track = @entries.find (entry) ->
          entry.get('href') is trackHref
        @play track

    render: ->
      @$el.html viewTemplate
      @

    play: (entry) ->
      @$('.btn.play').removeClass('play').addClass('stop')
      @$('.now-playing .track').html entry.get('name')
      @$('.now-playing .artist').html entry.get('artist')
      @$('.now-playing .album').html entry.get('album')
      @$('.info').html "Now Playing: "
      @$('.now-playing').fadeTo(250, 1)
      
      @playing = true
      @track = entry

      #todo: set timeout
        #progress bar

    stop: ->
      @$('.now-playing').fadeTo(250, 0.5)
      @$('.info').html "Stopped: "
      @$('.btn.stop').removeClass('stop').addClass('play')

    onPlayPress: (evt) -> @play (@track)

    onStopPress: (evt) -> @stop()

    events: 
      'click .play': 'onPlayPress'
      'click .stop': 'onStopPress'