define ['text!./results.html'], (viewTemplate) ->
  Backbone.View.extend
    initialize: ->
      @entries = @options.entries
      @entries.on "loaded", (evt) =>
        @render()

    render: ->
      @$el.html _.template(viewTemplate, {entries: @entries.toJSON()})
      @
