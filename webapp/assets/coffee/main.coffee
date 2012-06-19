require.config
  baseUrl: '/static/coffee/app' 
  paths: 
    text: '/static/js/require.text'
###JM: this should work - but getting intermittent Backbone not defined errors
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
###
define ["views/container"], (Container) ->
  $ ->
    new Container
      el: 'body'
    .render()