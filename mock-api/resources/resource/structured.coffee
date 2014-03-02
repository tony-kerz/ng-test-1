_ = require 'lodash'

module.exports = require('./mixin') ->
  class Structured
    walk: (attrs, fn) ->
      @_mapObject(@schema, attrs, fn)

    _mapObject: (obj, attrs, fn) ->
      _.object Object.keys(obj),
        _.map obj, (type, name) =>
          if typeof obj[name] is 'object'
            @_mapObject obj[name], attrs[name], fn
          else
            fn type, attrs[name]
