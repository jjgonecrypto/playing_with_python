define ['text!./playlist.html', 'collections/tracks'], (viewTemplate, Tracks) ->
  Backbone.View.extend
    initialize: ->
      @playlists = @options.playlists
      @playing = @options.playing
      @queue = @options.queue

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
      return unless @queue.get('tracks')?.length
      
      @playlists.create
        name: @$('.playlist-name').val()
        tracks: @queue.get('tracks')

    onDeleteClick: (evt) ->
      found = @playlists.get @$(evt.target).data("id")
      found.destroy() if (found) 

    onLoadClick: (evt) ->
      found = @playlists.get @$(evt.target).data("id")
      @queue.replace new Tracks(found.get('tracks'))

    events: 
      'click .save': 'onSaveClick'
      'click .delete': 'onDeleteClick'
      'click .load': 'onLoadClick'