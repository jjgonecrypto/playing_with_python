define ['text!./search.html','collections/entries', 'libs/eventbus'], (viewTemplate, Entries, bus) ->
  Backbone.View.extend
    initialize: ->
      @lastRequest = undefined
      @entries = new Entries()
      
      bus.on 'search:start', (evt) =>
        @$('.loading').show()

      bus.on 'search:stop', (evt) =>
        @$('.loading').hide()

    render: ->
      @$el.html viewTemplate
      @  

    onKeyPress: (evt) ->
      return if @$(evt.target).val().length < 3
      @entries.load @$(evt.target).serialize()

    playSong: (trackId) ->
      #return if @playing is trackId
      #$('.play-controls').html "<iframe src='https://embed.spotify.com/?uri=#{trackId}' frameborder='0' allowtransparency='true'></iframe>"
      #@playing = trackId
      
    events: 
      'keyup .spotify-lookup': 'onKeyPress'
      'change .spotify-lookup': 'onKeyPress'