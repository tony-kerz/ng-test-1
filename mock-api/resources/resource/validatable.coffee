_      = require 'lodash'
moment = require 'moment'

module.exports = require('./mixin') ->
  class Validatable
    valid: (attrs) ->
      _.all @walk attrs, (type, value) =>
        switch type
          when 'uuid'
            @_validateUUID value
          when Date
            @_validateDate value
          else
            _.type(value) is type

    _validateUUID: (value) ->
      _.type(value) is String

    _validateDate: (value) ->
      moment(value).isValid()
