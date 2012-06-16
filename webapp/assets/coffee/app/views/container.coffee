define [
  'text!./container.html' 
  'views/results' 
  'views/controls'
  'views/search'
], (viewTemplate, Results, Controls, Search) ->
  Backbone.View.extend
    initialize: ->

    render: ->
      @$el.html viewTemplate
      @$('.search').html new Search().render().el
      @$('.results').html new Results().render().el
      @$('.play-controls').html new Controls().render().el
      @