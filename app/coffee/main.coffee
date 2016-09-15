jadeConsole = require 'jade/console'

class Console

  @host :
    blurb   : 'Running console will open a terminal directly in your running host. This can be useful for running commands however should not be used for manual installations or for configuring your environment..'

  @docker :
    blurb   : 'Running console will open a terminal directly in your running docker container. This can be useful for running commands however should not be used for manual installations or for configuring your environment..'

  constructor: ($el, @params) ->
    data   = @getData @params
    @$node = $ jadeConsole( data )
    $el.append @$node
    castShadows @$node

    if data.isCluster
      @currentContent == 'host'
      $('.option', @$node).on 'click', (e)=>
        $('.option', @$node).removeClass 'active'
        $targ = $ e.currentTarget
        $targ.addClass 'active'
        @swapContent $targ.attr 'data-kind'

  getData : (params) ->
    data =
      klass       : 'component'
      title       : 'Console'
      blurb       : 'Running console will open a terminal directly in your running docker container. This can be useful for running commands however should not be used for manual installations or for configuring your environment..'
      command     : "nanobox console #{params.id}"
      mapIcon     : 'console-map'

    if params.kind == 'host' || params.kind == 'host-instance'
      data.klass = 'host'
      data.blurb = Console.host.blurb

    if params.kind == 'host-instance'
      data.isCluster = true
      data.mapIcon   = 'cluster-map'

    if params.tunnelCredentials?
      data.serviceIcon = params.serviceIcon
      data.klass       = 'data'
      data.title       = "DB Connection Tunnel"
      data.credentials = params.tunnelCredentials
      data.command     = "nanobox tunnel #{params.id}"

    data

  swapContent : (kind) ->
    return if @currentContent == kind
    @$node.removeClass @currentContent
    @currentContent = kind
    @$node.addClass kind
    data = Console[kind]
    $('.blurb .txt', @$node).html data.blurb
    id =  if kind == 'host' then @params.id else @params.dockerId
    $('.command', @$node).html "nanobox console #{id}"


  destroy : () ->


window.nanobox ||= {}
nanobox.Console = Console
