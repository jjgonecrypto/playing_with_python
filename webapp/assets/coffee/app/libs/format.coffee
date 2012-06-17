define [], () ->
  time: (length) ->
    secs = Math.round(length % 60)
    secs = "0"+secs if secs < 10
    Math.round(length / 60) + ":" + secs