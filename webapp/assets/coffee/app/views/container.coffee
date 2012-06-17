define [
  'text!./container.html' 
  'views/results' 
  'views/player'
  'views/search'
  'collections/tracks'
  'collections/entries'
  'models/playing'
], (viewTemplate, Results, Player, Search, Tracks, entries, Playing) ->
  Backbone.View.extend
    initialize: ->
      entries.set 
        tracks: new Tracks()
        artists: new Tracks()
        albums: new Tracks()

      @playing = new Playing()
     
    render: ->
      @$el.html viewTemplate
      @$('.search').html new Search({entries: entries}).render().el
      @$('.results').html new Results({entries: entries}).render().el
      @$('.player').html new Player({entries: entries, playing: @playing}).render().el
      @