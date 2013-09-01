should = require('chai').should()
js = require '..'

sample = """function sum(a, b){
  return a + b;
}"""

describe '[polvo-js]', ->

  it 'should compile code (actually, just pass it along)', ->
    count = err: 0, out: 0
    error = -> count.err++
    done = (compiled)->
      count.out++
      compiled.should.equal sample

    js.compile 'sample.js', sample, false, error, done
    count.err.should.equal 0
    count.out.should.equal 1