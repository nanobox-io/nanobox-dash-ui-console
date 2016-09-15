# Host Params
hostParams =
  id                : 'do.1'
  kind              : 'host'
  category          : 'web'

# Component Params
componentParams =
  id                : 'web.1'
  kind              : 'component'
  category          : 'web'

# Data Params
dataParams =
  id                : 'data.1'
  kind              : 'component'
  category          : 'web'
  serviceIcon       : 'mongo'
  tunnelCredentials :
    DB_HOST : '127.0.0.1'
    DB_PORT : '4000'
    DB_USER : 'nanobox'
    DB_PASS : 'yYBavcCUWuz'
    DB_NAME : 'data.db'

# Host Instance Params
hostInstance =
  id                : 'do.1'
  dockerId          : 'web.1'
  kind              : 'host-instance'
  category          : 'web'

new nanobox.Console $("body"), hostParams
new nanobox.Console $("body"), componentParams
new nanobox.Console $("body"), dataParams
new nanobox.Console $("body"), hostInstance
