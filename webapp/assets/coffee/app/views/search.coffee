define ['text!./search.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @lastQuery = undefined
      @entries = @options.entries
      
    render: ->
      @$el.html viewTemplate
      @  

    search: (evt) ->
      return if @$(evt.target).val().length < 3 or @lastQuery is @$(evt.target).val()

      query = @$(evt.target).serialize()

      @$('.loading').show()

      @lastQuery = @$(evt.target).val() 
      bus.trigger "search:query", @lastQuery 

      @entries.tracks.load query, (err) =>
        console.log(err) if err
        @entries.artists.load query, (err) =>
          console.log(err) if err
          @entries.albums.load query, (err) =>
            console.log(err) if err
            @$('.loading').hide()
        
    events: 
      'keyup .spotify-lookup': 'search'
      'change .spotify-lookup': 'search'