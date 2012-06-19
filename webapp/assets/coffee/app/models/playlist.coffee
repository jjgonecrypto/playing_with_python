define [], () ->
  Backbone.Model.extend
    urlRoot: '/api/v1/playlist'
    defaults:
      name: null
      tracks: []

    initialize: ->

    append: (track) ->
      @get('tracks').add track

    findBy: (href) ->
      @get('tracks').find (t) -> t.get('href') is href

    remove: (track) ->
      @get('tracks').remove track
        
    toFullJSON: () ->
      output = @toJSON()
      output.tracks = @get('tracks').toJSON() 
      output
