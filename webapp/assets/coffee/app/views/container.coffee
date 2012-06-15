define ['text!./container.html'], (viewTemplate) ->
  Backbone.View.extend
    initialize: ->

    render: ->
      @$el.html viewTemplate
      @