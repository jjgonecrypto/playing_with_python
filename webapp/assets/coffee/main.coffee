require.config
  baseUrl: '/static/coffee/app' 
  paths: 
    text: '/static/js/require.text'

define ["views/container"], (Container) ->
  $ ->
    ###
    Backbone.sync = (method, model, options) ->
      resp = undefined
      store = model.localStorage or model.collection.localStorage
      switch method
        when "read"
          resp = (if model.id then store.find(model) else store.findAll())
        when "create"
          resp = store.create(model)
        when "update"
          resp = store.update(model)
        when "delete"
          resp = store.destroy(model)

      if resp
        options.success resp
      else
        options.error "Record not found"
    ###
    
    new Container
      el: 'body'
    .render()