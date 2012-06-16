define ['text!./results.html', 'libs/eventbus'], (viewTemplate, bus) ->
  Backbone.View.extend
    initialize: ->
      @entries = @options.entries
      @entries.on "loaded", (evt) =>
        @render()

    render: ->
      @$el.html _.template(viewTemplate, {entries: @entries.toJSON()})
      @

    playTrack: (evt) ->
      evt.preventDefault()
      href = @$(evt.target).data("href")
      bus.trigger "player:play", href

    events:
      'click .play': 'playTrack'