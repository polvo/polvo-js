(require 'source-map-support').install
  handleUncaughtExceptions: false

module.exports = new class Index

  type: 'script'
  name: 'javascript'
  output: 'js'

  ext: /\.js$/m
  exts: [ '.js' ]

  compile:( filepath, source, debug, error, done )->
    done source, null