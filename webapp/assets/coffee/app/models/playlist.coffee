define [], () ->
  Backbone.Model.extend
    defaults:
      name: null
      tracks: []