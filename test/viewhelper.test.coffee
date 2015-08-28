supertest = require 'supertest'

express = require 'express'
expressMincer = require '..'

app = express()

pipelineConfig = 
  root: __dirname
  manifest: 'public/assets/manifest.json'
  compile: 
    files: false

assetPipeline = expressMincer pipelineConfig

app.use assetPipeline.viewHelper()

app.use '/', (req, res) -> res.json res.locals

requiest = supertest app

describe "ExpressMincer ViewHelper", ->
  it "should have a helper script", ->
  it "should have a helper style", ->
  it "should have a helper asset_path", ->



