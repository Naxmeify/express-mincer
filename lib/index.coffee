Mincer = require 'mincer'
_ = require 'lodash'

class AssetPipeline
  
  # private properties
  defaultConfig: require('./properties/defaultConfig')
  helper: require('./properties/helper')
  environment: null
  
  # public (prototyped) properties
  LOG: require('debug') 'express:mincer'
  
  # private methods
  proof: require('./prototypes/proof')
  
  # public prototypes
  addViewHelper: require('./prototypes/addViewHelper')
  viewHelper: require('./prototypes/viewHelper')
  server: require('./prototypes/server')
  
  # constructor
  constructor: (@config) ->
    @LOG "init express mincer asset pipeline"
    @conig = _.merge @defaultConfig, @config
    
    try
      @proof()
    catch err
      throw err
    
    environment = new Mincer.Environment
    
    
  
exports = module.exports = (config={}) ->
  try
    return new AssetPipeline config
  catch err
    throw err
  
exports.AssetPipeline = AssetPipeline