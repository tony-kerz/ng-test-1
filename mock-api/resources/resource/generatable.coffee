_      = require 'lodash'
uuid   = require 'uuid'
moment = require 'moment'

module.exports = require('./mixin') ->
  class Generatable
    generate: (defaults) ->
      _.extend @_filterDependents(@walk @constraints, (type, constraints) =>
        switch type
          when 'id'
            @id.generate()
          when 'uuid'
            uuid.v4()
          when Boolean
            !!_.random(1)
          when Date
            @_generateDate constraints
          when Number
            @_generateNumber constraints
          when String
            @_generateString constraints
      ), defaults

    _generateDate: (constraints) ->
      if constraints?.between
        @_generateDateBetween constraints.between
      else
        moment().toString()

    _generateDateBetween: (constraint) ->
      moment(@_generateNumberBetween constraint).format('YYYYMM').toString()

    _generateNumber: (constraints) ->
      if constraints?.between
        @_generateNumberBetween constraints.between
      else
        _.random(100)

    _generateNumberBetween: (constraint) ->
      lo = +constraint[0]
      hi = +constraint[1]
      _.random(hi - lo) + lo

    _generateString: (constraints) ->
      if constraints?.in and isArray(constraints.in)
        randomElement(constraints.in)
      else
        @id.generate()

    _filterDependents: (resource) ->
      _.omit(resource, _.compact(_.map(@dependables, (dependable, v) ->
        if resource[dependable.dependant] is dependable.value
          v
        else
          false)))

isArray = (anObject) ->
  Object.prototype.toString.call( anObject ) is '[object Array]'

randomElement = (anArray) ->
  anArray[Math.floor(Math.random() * anArray.length)]

