define ['text!./playlist.html'], (viewTemplate) ->
  Backbone.View.extend
    initialize: ->
      @playlists = @options.playlists

      @playlists.fetch().done (data) =>
        @render()
      .fail (req, err) ->
        console.log err      

    render: ->
      @$el.html _.template(viewTemplate, {playlists: @playlists.toJSON()})

