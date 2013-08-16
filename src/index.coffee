(require 'source-map-support').install
  handleUncaughtExceptions: false

module.exports = new class Index

  polvo: true

  type: 'script'
  name: 'javascript'
  output: 'js'

  ext: /\.js$/m
  exts: [ '.js' ]

  compile:( filepath, source, debug, done )->
    done source, null