define ['models/track', 'services/spotify'], (Track, spotify) ->
  Backbone.Collection.extend
    model: Track
    url: '/api/v1/track'
    
    initialize: ->

    load: (query, callback) ->

      spotify.load query, 'track', (err, data) =>
        return callback(err) if err

        @reset() 

        top5 = _.first(data.tracks, 5)
        _.each top5, (entry) =>
          @add 
            name: entry.name
            href: entry.href
            artist: entry.artists?[0]?.name ? ''
            album: entry.album?.name ? ''
            length: entry.length
        @trigger "loaded"
        callback()