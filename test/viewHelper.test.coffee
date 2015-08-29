supertest = require 'supertest'

express = require 'express'
expressMincer = require '..'

app = express()

pipelineConfig = 
  root: __dirname
  paths: [
    'assets'
    'vendor'
  ]
  manifest: 'public/assets/manifest.json'
  
  protocol: 'https'
  host: 'my.amazing.cdn.net'
  
  compile: 
    files: false
    fonts: true
    images: true

assetPipeline = expressMincer pipelineConfig

app.use assetPipeline.viewHelper()

app.use '/', (req, res) -> res.json res.locals

requiest = supertest app

describe "ExpressMincer ViewHelper", ->
  it "should have a helper script", ->
  it "should have a helper style", ->
  it "should have a helper asset_path", ->



