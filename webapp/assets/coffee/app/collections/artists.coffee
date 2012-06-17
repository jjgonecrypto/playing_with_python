define ['models/artist', 'services/spotify'], (Artist, spotify) ->
  Backbone.Collection.extend
    model: Artist

    initialize: ->
      
    load: (query, callback) ->

      spotify.load query, 'artist', (err, data) =>
        return callback(err) if err

        @reset() 

        top5 = _.first(data.artists, 5)
        _.each top5, (entry) =>
          @add 
            name: entry.name
            href: entry.href
        @trigger "loaded"
        callback()