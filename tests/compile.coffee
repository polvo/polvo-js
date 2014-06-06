should = require('chai').should()
js = require '..'

sample = """function sum(a, b){
  return a + b;
}"""

sample_err = """function sum(a, b){
  var a = 1;
  return a + b *;
}
"""

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

  it 'should detect invalid syntax and raise error', ->
    count = err: 0, out: 0
    error = -> count.err++
    done = (compiled)->
      count.out++
      compiled.should.equal ''

    js.compile 'sample.js', sample_err, false, error, done

    count.err.should.equal 1
    count.out.should.equal 1