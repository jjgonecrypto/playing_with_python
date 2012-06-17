define ['text!./playlist.html', 'collections/tracks', 'models/playlist'], (viewTemplate, Tracks, Playlist) ->
  Backbone.View.extend
    initialize: ->
      @playlists = @options.playlists
      @playing = @options.playing

      @playlists.fetch().done (data) =>
        @render()
      .fail (req, err) ->
        console.log err      

    render: ->
      @$el.html _.template(viewTemplate, {playlists: @playlists.toJSON()})
      @

    onSaveClick: (evt) ->
      return unless @playing.track()
      
      #tracks = new Tracks()

      #@playing.track().save().done () =>
      #tracks.create()
      new Playlist
        name: @$('.playlist-name').val()
        tracks: new Tracks([@playing.track()])
      .save()
        
      #@playlists.create
       # name: @$('.playlist-name').val()
       # tracks: tracks

    events: 
      'click .save-playlist': 'onSaveClick'