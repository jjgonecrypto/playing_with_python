define ['models/track', 'libs/eventbus', 'services/spotify'], (Track, bus, spotify) ->
  Backbone.Collection.extend
    model: Track

    initialize: ->
      #@lastRequest = undefined

    load: (query, callback) ->

      #bus.trigger('search:start')

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