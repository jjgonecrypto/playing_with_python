define ['text!./player.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @playing = @options.playing
      @entries = @options.entries
      @playing.on 'start', (track) =>
        @showPlaying() 

      @playing.on 'tick', (position) =>
        @$('.now-playing .progress-bar').progressbar
          value: position / @playing.track().get('length') * 100
        @$('.now-playing .elapsed').html @timeFormat(@playing.get('position')) 
          
    render: ->
      @$el.html viewTemplate
      @

    showPlaying: () ->
      return unless @playing.track()
      @$('.btn.play').removeClass('play').addClass('stop')
      @$('.now-playing .track').html @playing.track().get('name')
      @$('.now-playing .artist').html @playing.track().get('artist')
      @$('.now-playing .album').html @playing.track().get('album')
      @$('.now-playing .total').html @timeFormat(@playing.track().get('length')) 
        
      @$('.info').html "Now Playing: "
      @$('.now-playing').fadeTo(250, 1)
      
    showStopped: ->
      @$('.now-playing').fadeTo(250, 0.5)
      @$('.info').html "Stopped: "
      @$('.btn.stop').removeClass('stop').addClass('play')

    onPlayPress: (evt) -> 
      return unless @playing.track()
      bus.trigger 'player:play'
      @showPlaying()

    onStopPress: (evt) -> 
      bus.trigger 'player:stop'
      @showStopped()

    timeFormat: (length) ->
      secs = Math.round(length % 60)
      secs = "0"+secs if secs < 10
      Math.round(length / 60) + ":" + secs

    events: 
      'click .play': 'onPlayPress'
      'click .stop': 'onStopPress'