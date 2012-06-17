define ['models/playlist'], (Playlist) ->
  Backbone.Collection.extend
    model: Playlist
    url: '/api/playlists'
    #localStorage: new Backbone.LocalStorage("Playlists")

    initialize: ->


