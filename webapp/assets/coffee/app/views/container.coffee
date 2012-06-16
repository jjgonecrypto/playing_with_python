define ['text!./container.html', 'views/results', 'views/controls'], (viewTemplate, Results, Controls) ->
  Backbone.View.extend
    initialize: ->

    render: ->
      @$el.html viewTemplate
      @$('.results').html new Results().render().el
      @$('.play-controls').html new Controls().render().el
      @