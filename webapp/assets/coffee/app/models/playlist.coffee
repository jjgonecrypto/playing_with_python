define [], () ->
  Backbone.Model.extend
    urlRoot: '/api/v1/playlist'
    defaults:
      name: null
      tracks: []