require.config
  baseUrl: '/static/coffee/app' 
  paths: 
    text: '/static/js/require.text'
    underscore: '/static/js/underscore-min'
    backbone: '/static/js/backbone-min'
    backboneTP: '/static/js/backbone-tastypie'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ["underscore"]
      exports: "Backbone"
    backboneTP: 
      deps: ["backbone"]

define ["backboneTP", "views/container"], (bb, Container) ->
  $ ->
    new Container
      el: 'body'
    .render()