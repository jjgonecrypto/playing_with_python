define [
  'text!./container.html' 
  'views/results' 
  'views/player'
  'views/search'
  'collections/entries'
  'collections/tracks'
  'collections/artists'
  'collections/albums'
  'models/playing'
  'collections/playlists'
  'views/playlist'
], (viewTemplate, Results, Player, Search, entries, Tracks, Artists, Albums, Playing, Playlists, PlaylistView) ->
  Backbone.View.extend
    initialize: ->
      @playlists = new Playlists()

      entries.set 
        tracks: new Tracks()
        artists: new Artists()
        albums: new Albums()

      @playing = new Playing()
     
    render: ->
      @$el.html viewTemplate
      @$('.search').html new Search({entries: entries}).render().el
      @$('.results').html new Results({entries: entries}).render().el
      @$('.player').html new Player({entries: entries, playing: @playing}).render().el
      @$('.playlists').html new PlaylistView({playlists: @playlists, playing: @playing}).render().el
      @