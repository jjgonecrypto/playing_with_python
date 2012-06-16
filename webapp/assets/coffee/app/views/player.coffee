define ['text!./player.html'], (viewTemplate) ->
  Backbone.View.extend
    render: ->
      @$el.html viewTemplate
      @