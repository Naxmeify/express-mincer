express = require 'express'
expressMincer = require '..'

app = express()

app.set 'view engine', 'jade'

pipelineConfig = require './pipeline-config'
assetPipeline = expressMincer pipelineConfig

app.use assetPipeline.viewHelper()
app.use '/assets' assetPipeline.server() if app.get('env') is 'production'

app.use '/', (req, res) ->
  res.render 'application'

app.listen process.env.PORT or 3000