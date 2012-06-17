define [
  'text!./container.html' 
  'views/results' 
  'views/player'
  'views/search'
  'collections/entries'
  'models/playing'
], (viewTemplate, Results, Player, Search, Entries, Playing) ->
  Backbone.View.extend
    initialize: ->
      @entries = new Entries()
      @playing = new Playing()

    render: ->
      @$el.html viewTemplate
      @$('.search').html new Search({entries: @entries}).render().el
      @$('.results').html new Results({entries: @entries}).render().el
      @$('.player').html new Player({entries: @entries, playing: @playing}).render().el
      @