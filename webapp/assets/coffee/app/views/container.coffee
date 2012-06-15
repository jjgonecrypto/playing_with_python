define ['text!./Container.html'], (viewTemplate) ->
  Backbone.View.extend
    initialize: ->

    render: ->
      @$el.html viewTemplate
      @