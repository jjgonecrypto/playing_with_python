define ['text!./results.html', 'collections/entries'], (viewTemplate, entries) ->
  Backbone.View.extend
    initialize: ->
      @entries = @options.entries
      
    render: ->
      @$el.html viewTemplate
      @
