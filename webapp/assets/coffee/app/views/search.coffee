define ['text!./search.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @lastQuery = undefined
      @tracks = @options.entries.tracks
      

    render: ->
      @$el.html viewTemplate
      @  

    search: (evt) ->
      return if @$(evt.target).val().length < 3 or @lastQuery is @$(evt.target).val()

      query = @$(evt.target).serialize()

      @$('.loading').show()

      @tracks.load query, (err) =>
        console.log(err) if err
        #@artists.load query, (err) =>
        #  console.log(err) if err
        #  @albums.load query, (err) =>
        #    console.log(err) if err
        #    @$('.loading').hide()
        @$('.loading').hide()

      @lastQuery = @$(evt.target).val() 

    events: 
      'keyup .spotify-lookup': 'search'
      'change .spotify-lookup': 'search'