define ['text!./playlist.html', 'collections/tracks'], (viewTemplate, Tracks) ->
  Backbone.View.extend
    initialize: ->
      @playlists = @options.playlists
      @playing = @options.playing

      @playlists.fetch().done (data) =>
        @render()
      .fail (req, err) ->
        console.log err      

      @playlists.on "change", => @render()
      @playlists.on "remove", => @render()
      
    render: ->
      @$el.html _.template(viewTemplate, {playlists: @playlists.toJSON()})
      @

    onSaveClick: (evt) ->
      return unless @playing.track()
      
      @playlists.create
        name: @$('.playlist-name').val()
        tracks: new Tracks([@playing.track()])

    onDeleteClick: (evt) ->
      found = @playlists.get @$(evt.target).data("id")
      found.destroy() if (found) 

    events: 
      'click .save-playlist': 'onSaveClick'
      'click .delete-playlist': 'onDeleteClick'