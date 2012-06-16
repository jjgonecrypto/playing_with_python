define [
  'text!./container.html' 
  'views/results' 
  'views/player'
  'views/search'
  'collections/entries'
], (viewTemplate, Results, Player, Search, Entries) ->
  Backbone.View.extend
    initialize: ->
      @entries = new Entries()
      
    render: ->
      @$el.html viewTemplate
      @$('.search').html new Search({entries: @entries}).render().el
      @$('.results').html new Results({entries: @entries}).render().el
      @$('.player').html new Player().render().el
      @