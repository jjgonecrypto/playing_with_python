define [], () ->
  
  dispatcher = _.extend({}, Backbone.Events)

  dispatcher.set = (collections) ->
    @tracks = collections.tracks
    @artists = collections.artists
    @albums = collections.albums

    @tracks.on "loaded", (evt) =>
      @trigger "loaded"

  return dispatcher