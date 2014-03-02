_ = require 'lodash'

module.exports = (fn) ->
  (klass) ->
    # So that super still works, reevaluate the class every time it's mixed in.
    Mixin = fn()
    _.extend(klass::, Mixin::)
    Mixin.__super__ = klass.__super__
