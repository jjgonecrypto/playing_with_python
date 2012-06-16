define ["text!./results.html"], (viewTemplate) ->
  Backbone.View.extend
    initialize: ->

    render: ->
      @$el.html viewTemplate
      @
