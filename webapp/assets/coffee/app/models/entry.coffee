define [], () ->
  Backbone.Model.extend
    defaults:
      name: ""
      href: ""
      type: ""
      artist: ""
      album: ""
      length: 1

