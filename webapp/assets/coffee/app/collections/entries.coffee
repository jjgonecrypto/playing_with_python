define ['models/entry', 'libs/eventbus'], (Entry, bus) ->
  Backbone.Collection.extend
    model: Entry

    initialize: ->
      @lastRequest = undefined

    load: (query) ->
      console.log query

      bus.trigger('search:start')

      @lastRequest.abort() if @lastRequest

      loadSequentially = (types, index) =>
        return bus.trigger('search:stop') if types.length <= index

        url = "http://ws.spotify.com/search/1/#{types[index]}.json?#{query}"
        
        console.log "GET #{url}"
        
        @lastRequest = $.ajax
          url: url
        .done (data) =>
          @populate data, types[index]+"s"
          loadSequentially(types, index+1)
        .fail (req, err) =>
          loadSequentially(types, index+1)

      loadSequentially(['track', 'artist', 'album'], 0)

    populate: (data, type) ->
      @remove @where
        type: type

      @trigger "cleared", type
        
      top5 = _.first(data[type], 5)
      _.each top5, (entry) =>
        @add 
          name: entry.name
          type: type 
          href: entry.href
          artist: entry.artists?[0]?.name ? ''
          album: entry.album?.name ? ''
          length: entry.length
      @trigger "loaded"