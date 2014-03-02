_           = require 'lodash'

routable    = require './routable'
proxiable   = require './proxiable'
structured  = require './structured'
generatable = require './generatable'
validatable = require './validatable'

_.mixin
  type: (v) ->
    return String if typeof v == 'string' or v instanceof String
    return Number if typeof v == 'number' or v instanceof Number
    return Boolean if typeof v == 'boolean' or v instanceof Boolean
    return Function if v instanceof Function
    return Date if v instanceof Date
    return RegExp if v instanceof RegExp
    return Array if v instanceof Array
    return Object if v instanceof Object

class Resource
  routable @
  structured @
  generatable @
  validatable @

module.exports = Resource
