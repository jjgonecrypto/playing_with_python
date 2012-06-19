define [
  'text!./container.html' 
  'views/results' 
  'views/player'
  'views/search'
  'views/queue'
  'collections/entries'
  'collections/tracks'
  'collections/artists'
  'collections/albums'
  'models/playing'
  'models/playlist'
  'collections/playlists'
  'views/playlist'
], (viewTemplate, Results, Player, Search, Queue, entries, Tracks, Artists, Albums, Playing, Playlist, Playlists, PlaylistView) ->
  Backbone.View.extend
    initialize: ->
      @playlists = new Playlists()
      @queue = new Playlist
        tracks: new Tracks()

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
      @$('.queue').html new Queue({queue: @queue, playing: @playing}).render().el
      @$('.playlists').html new PlaylistView({playlists: @playlists, playing: @playing, queue: @queue}).render().el
      @