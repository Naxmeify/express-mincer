class AssetPipeline
  @helper: require('./properties/helper')
  
  addViewHelper: require('./prototypes/addViewHelper')
  viewHelper: require('./prototypes/viewHelper')
  server: require('./prototypes/server')
  
  constructor: (@config) ->
    
  
exports = module.exports = (config={}) ->
  new AssetPipeline config
  
exports.AssetPipeline = AssetPipeline