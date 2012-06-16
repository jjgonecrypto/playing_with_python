define [
  'text!./container.html' 
  'views/results' 
  'views/controls'
  'views/search'
  'collections/entries'
], (viewTemplate, Results, Controls, Search, Entries) ->
  Backbone.View.extend
    initialize: ->
      @entries = new Entries()

    render: ->
      @$el.html viewTemplate
      @$('.search').html new Search({entries: @entries}).render().el
      @$('.results').html new Results({entries: @entries}).render().el
      @$('.play-controls').html new Controls().render().el
      @