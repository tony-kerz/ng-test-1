_       = require 'lodash'
express = require 'express'

module.exports = require('./mixin') ->
  class Routable
    route: (server) ->

      all = @root
      one = @root + '/:id'

      server.get all, @_action_(@_index)
      server.get one, @_action_(@_show)
      server.put one, express.bodyParser(), @_action_(@_update)
      server.post all, express.bodyParser(), @_action_(@_create)
      server.delete one, @_action_(@_delete)
      server.post "#{@root}/seed", express.bodyParser(), @_action_(@_seed)

    _action_: (action) ->
      (req, res) =>
        res.send (action.apply @, _.compact([req.params.id, req.body])) or 404

    _index: ->
      @collection

    _show: (id) ->
      _.find @collection, {id}

    _update: (id, attrs) ->
      found = _.find @collection, {id}

      if found
        _.extend found, attrs

    _create: (attrs) ->
      @collection.push attrs

    _delete: (id) ->
      found = _.findIndex @collection, {id}

      if found
        @collection[found] = {}

    _seed: (newCollection) ->
      @collection = newCollection.map (item) =>
        @generate item
