# express-mincer

[![Build Status](https://travis-ci.org/Naxmeify/express-mincer.svg)](https://travis-ci.org/Naxmeify/express-mincer)

## Installation

```
$ npm install --save express-mincer
```

## Usage

*application.coffee*
```CoffeeScript
express = require 'express'
expressMincer = require 'express-mincer'

app = express()

pipelineConfig = require './pipeline-config'
assetPipeline = expressMincer pipelineConfig

app.use assetPipeline.viewHelper()
app.use '/assets' assetPipeline.server() unless app.get('env') is 'production'
```

*pipeline-config.coffee*
```CoffeeScript
module.exports = 
  root: __dirname
  
  paths: [
    'assets/scripts'
    'assets/styles'
    'assets/images'
    'vendor'
  ]
  
  manifest: 'public/assets/manifest.json'
  
  protocol: 'https'
  host: 'my.amazing.cdn.net'
  
  compile: 
    files: [
      'app.js'
      'app.css'
      
      '*.extension'
      '**/*.extension'
    ]
    
    fonts: true
    images: true
    
  assetHelper: []
```

### for precompile
```
$ express-mincer path/to/pipeline-config.coffee
```

## Configuration

### root
The ``` root ``` config defines the root path to the assets folder. 
**(is required config attribute)**

If we define ``` '/myproject/root' ``` as root path and ``` 'assets' ``` as one
asset folder path. The result for the asset path will become 
``` '/myproject/root/assets' ```.

### paths
Here you can define your assets folder paths. **(is required config attribute)**

**Example**:

So if ``` 'scripts' ``` is containing a file called ``` 'app.coffee' ``` we can
get with ``` 'require app.js' ```.

And if ``` 'scripts' ``` is containing a file called ``` 'foo/bar.coffee' ``` 
we can get with ``` 'require foo/bar.js' ```.

**Another example**:

If we define ``` 'vendor' ``` as one asset folder and ``` 'vendor' ```
is containing some sub folders like ``` 'jquery' ```, ``` 'bootstrap' ```, and 
``` 'angular' ``` (all from bower). The references would be:

```
'require jquery/dist/jquery.js'
'require angular/angular.js'
'require bootstrap/dist/js/bootstrap.js'
```

### manifest

This is required for produciton mode. The Mincer.Server need this information.
We also use it for precompilation. **(is required config attribute)**

### protocol & host

#### protocol

Can be null, 'http' or 'https'. It will be used by the viewHelper to load
assets from cdn. **(default is null)**

### host

Should be a domain. It will be used by the viewHelper to load
assets from cdn. **(default is null)**

### compile

Here we configure the precompilation process. **(is required config attribute)**

#### files
we can specify the files inside or assets folder. 
**(is required config attribute)**

Have to be an array or a boolean.

```
files: [] # means all files
files: ['bla.coffee'] # means only bla.coffee (of course whatever he requires)
files: false # means no file... yeah... no file...
file: true # same as empty array - all files
```

**HINT: If you work with bower and take "all files" it will become a problem
with files with no extension like a "LICENSE" file.**

#### fonts & images

these are useful shortcuts. if you specify only some files in files 
config-attribute like app.css and app.css is gonna require bootstrap.css then
bootstrap will be compiled inside app.css but there will be no fonts like
glyphicons. So you have to specify fonts inside the files config-attribute
or set "fonts config-attribute" to true.

nevermind...both attribute a true by default.

## Contributing

Issue, Fork, Pull Request - whatever you want to.

## License

The MIT License (MIT)

Copyright (c) 2015 MRW Neundorf <matt@nax.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

