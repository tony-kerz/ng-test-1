_        = require 'lodash'
moment   = require 'moment'
ClaimSummary = require './claim-summary.resource'
ClaimSummaryBase = require './claim-summary-base.resource'

categories = ['Dermatology', 'Oncology', 'Orthopedics']

class ClaimCategoryElement extends ClaimSummaryBase
  constructor: ->
    @collection = _.times 3, (index) =>
      @generate(name: categories[index])

class ClaimCategory extends ClaimSummary
  root: '/api/claims/category'

  constructor: ->
    @collection = _.times 6, (index) =>
      #@generate(date: "2013#{@month(index)}", procedure_categories: [new ClaimCategoryElement])
      @generate(date: "2013#{@month(index)}", procedure_categories: new ClaimCategoryElement)
    #@collection = @collection.concat _.times 6, (index) =>
    #  @generate(date: "2014#{month(index)}", procedure_categories: new ClaimCategoryElement.collection())

module.exports = ClaimCategory

