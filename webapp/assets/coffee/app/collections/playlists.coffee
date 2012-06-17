define ['models/playlist'], (Playlist) ->
  Backbone.Collection.extend
    model: Playlist
    url: '/api/v1/playlist'
    #localStorage: new Backbone.LocalStorage("Playlists")

    initialize: ->


