define ['collections/tracks'], (Tracks) ->
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

    replace: (tracks) ->
      @set 'tracks', tracks
      @trigger 'replaced'

    first: () ->
      @get('tracks').at(0)
      
    next: (before) ->
      i = @get('tracks').models.indexOf(before)
      @get('tracks').at(i+1)
       
    prev: (after) ->
      i = @get('tracks').models.indexOf(after)
      @get('tracks').at(i-1) 

    toFullJSON: () ->
      output = @toJSON()
      output.tracks = @get('tracks').toJSON() 
      output
