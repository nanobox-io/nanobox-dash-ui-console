example = require 'jade/console'

class Console

  constructor: ($el) ->
    $node = $ example( {  } )
    $el.append $node

window.nanobox ||= {}
nanobox.Console = Console
