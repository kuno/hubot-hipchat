{object} = require "underscore"

# Suppresses any console messages generated while requiring a module
# when quiet is truthy
exports.require = (name, quiet) ->
  if quiet
    orig = object ([k, v] for own k, v of console)
    console[k] = (->) for own k, v of orig
  mod = require name
  if quiet
    console[k] = v for own k, v of orig
  mod

exports.deHtml = (unsafe) ->
  return unsafe
         .replace(/&amp;/g, "&")
         .replace(/&lt;/g, "<")
         .replace(/&gt;/g, ">")
         .replace(/&quot;/g, "\"")
         .replace(/&#039;/g, "'")
