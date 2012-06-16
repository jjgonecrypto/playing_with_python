define ['text!./search.html','collections/entries', 'libs/eventbus'], (viewTemplate, Entries, bus) ->
  Backbone.View.extend
    initialize: ->
      @lastQuery = undefined
      @entries = @options.entries
      
      bus.on 'search:start', (evt) =>
        @$('.loading').show()

      bus.on 'search:stop', (evt) =>
        @$('.loading').hide()

    render: ->
      @$el.html viewTemplate
      @  

    search: (evt) ->
      return if @$(evt.target).val().length < 3 or @lastQuery is @$(evt.target).val()
      @entries.load @$(evt.target).serialize()
      @lastQuery = @$(evt.target).val() 

    playSong: (trackId) ->
      #return if @playing is trackId
      #$('.play-controls').html "<iframe src='https://embed.spotify.com/?uri=#{trackId}' frameborder='0' allowtransparency='true'></iframe>"
      #@playing = trackId
      
    events: 
      'keyup .spotify-lookup': 'search'
      'change .spotify-lookup': 'search'