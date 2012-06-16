define ['models/entry', 'libs/eventbus'], (Entry, bus) ->
  Backbone.Collection.extend
    model: Entry

    initialize: ->
      @lastRequest = undefined

    load: (query) ->
      console.log query

      bus.trigger('search:start')

      @lastRequest.abort() if @lastRequest

      @lastRequest = $.ajax
        url: 'http://ws.spotify.com/search/1/track.json?' + query
      .done (data) =>
        @populate data, 'tracks'
        #@playSong(data.tracks[0].href) unless !data.tracks.length
        bus.trigger('search:stop')
      .fail (req, err) =>
        bus.trigger('search:stop')

    populate: (data, type) ->
      @remove @where
        type: type
        
      top5 = _.first(data[type], 5)
      _.each top5, (entry) =>
        @add 
          name: entry.name
          type: type 
          href: entry.href
      console.log @length