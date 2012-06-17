define ['models/album', 'services/spotify'], (Album, spotify) ->
  Backbone.Collection.extend
    model: Album

    initialize: ->

    load: (query, callback) ->

      spotify.load query, 'album', (err, data) =>
        return callback(err) if err

        @reset() 

        top5 = _.first(data.albums, 5)
        _.each top5, (entry) =>
          @add 
            name: entry.name
            href: entry.href
            artist: entry.artists?[0]?.name ? ''
        @trigger "loaded"
        callback()