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