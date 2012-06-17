define [], () ->
  Backbone.Model.extend
    urlRoot: '/api/v1/track'

    defaults:
      name: ""
      href: ""
      artist: ""
      album: ""
      length: 1

