should = require 'should'

express = require 'express'
expressMincer = require '..'

app = express()

describe "ExpressMincer Prototype proof", ->
  
  pipelineConfig = null
  
  beforeEach ->
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
      
  tests = [
    {spec:'no root is defined', action: -> delete pipelineConfig.root}
    {spec:'root is not a string', action: -> pipelineConfig.root = false}
    {spec:'paths is not an array', action: -> delete pipelineConfig.paths}
    {spec:'paths is empty', action: -> pipelineConfig.paths = []}
    {spec:'protocol is illegal', action: -> pipelineConfig.protocol = 'foo'}
    {spec:'host is not a string', action: -> pipelineConfig.host = false}
    {spec:'no manifest is defined', action: -> pipelineConfig.manifest = false}
  ]
  
  tests.forEach (test) ->
    it "should throw an error if #{test.spec}", ->
      test.action()
      (->expressMincer(pipelineConfig)).should.throw()

