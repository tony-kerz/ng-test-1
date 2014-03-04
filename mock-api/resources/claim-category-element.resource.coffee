_        = require 'lodash'
moment   = require 'moment'
ClaimSummaryBase = require './claim-summary-base.resource'
Id = require './resource/id'

class ClaimCategoryElement extends ClaimSummaryBase
  id: new Id
  root: '/dummy'

  constructor: ->
    @schema.id = 'id'
    #@schema.name = String
    @collection = _.times 1, (index) =>
      @generate(name: 'Dermatology')

module.exports = ClaimCategoryElement

