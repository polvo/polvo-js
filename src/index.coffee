(require 'source-map-support').install
  handleUncaughtExceptions: false

esprima = require 'esprima'

module.exports = new class Index

  type: 'script'
  name: 'javascript'
  output: 'js'

  ext: /\.js$/m
  exts: [ '.js' ]

  compile:( filepath, source, debug, error, done )->

    try
      esprima.parse source
    catch err
      if err?
        done ''
        return error err

    done source