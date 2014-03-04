_ = require 'lodash'
ClaimSummaryBase = require './claim-summary-base.resource'

class ClaimSummary extends ClaimSummaryBase
  root: '/api/claims/summary'

  constructor: ->
    @schema.date = Date
    @collection = _.times 6, (index) =>
      @generate(date: "2013#{@month(index)}")
    @collection = @collection.concat _.times 6, (index) =>
      @generate(date: "2014#{@month(index)}")

  month: (index) ->
    if ++index < 10 then '0' + index else index

module.exports = ClaimSummary

