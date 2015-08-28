Mincer = require 'mincer'
_ = require 'lodash'

class AssetPipeline

  # private properties
  defaultConfig = require('./properties/defaultConfig')
  helper = require('./properties/helper')
  environment = null
  
  addViewHelper: require('./prototypes/addViewHelper')
  viewHelper: require('./prototypes/viewHelper')
  server: require('./prototypes/server')
  
  constructor: (@config) ->
    @conig = _.merge defaultConfig, @config
    
    environment = new Mincer.Environment
    
    
  
exports = module.exports = (config={}) ->
  new AssetPipeline config
  
exports.AssetPipeline = AssetPipeline