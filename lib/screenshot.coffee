page = require('webpage').create()
system = require 'system'

address = system.args[1]
output = system.args[2]
page.viewportSize = { width: 600, height: 800 }

page.open address, (status) ->
  if status isnt 'success'
    console.log 'Unable to load the address!'
    phantom.exit()
  else
    window.setTimeout (-> page.render output; phantom.exit()), 200
