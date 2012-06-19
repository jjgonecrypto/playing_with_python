define [], () ->
  time: (length) ->
    secs = Math.floor(length % 60)
    secs = "0"+secs if secs < 10
    Math.floor(length / 60) + ":" + secs