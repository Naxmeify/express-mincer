_ = require 'lodash'

module.exports = ->
  unless @config.root?
    @LOG 'no assets root defined'
    throw new Error 'no assets root defined'
    
  if @config.root? and not _.isString @config.root
    @LOG 'defined root have to be a string'
    throw new Error 'defined root have to be a string'
    
  unless _.isArray(@config.paths)
    @LOG 'paths have to be an array of paths'
    throw new Error 'paths have to be an array of paths'
  
  if @config.paths.length is 0
    @LOG 'no paths for assets define'
    throw new Error 'no paths for assets define'
    
  switch @config.protocol
    when null then
    when '//' then
    when 'http' then
    when 'https' then
    else
      @LOG 'illegal protocol defined'
      throw new Error 'illegal protocol defined'
      
  if @config.host? and not _.isString @config.host
    @LOG 'defined host have to be a string'
    throw new Error 'defined host have to be a string'
    
  if @config.manifest? and not _.isString @config.manifest
    @LOG 'defined manifest have to be a string'
    throw new Error 'defined manifest have to be a string'