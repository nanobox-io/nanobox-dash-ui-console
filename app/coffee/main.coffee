example = require 'jade/console'

class Console

  constructor: ($el) ->
    $node = $ example( {  } )
    $el.append $node
    castShadows $node

  destroy : () ->


window.nanobox ||= {}
nanobox.Console = Console
