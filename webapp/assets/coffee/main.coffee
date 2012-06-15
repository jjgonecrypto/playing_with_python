require.config
  baseUrl: '/static/coffee/app' 
  paths: 
    text: '/static/js/require.text'

define ["views/container"], (Container) ->
  $ ->
    new Container
      el: 'body'
    .render()