_        = require 'lodash'
moment   = require 'moment'
Resource = require './resource'

class ClaimCategory extends Resource
  id: new (require './resource/id')

  root: '/api/claims/categories'

  collection: []

  schema:
    id: 'id'
    date: Date
    category: String
    in:
      paid_dollars: Number
      count: Number
    out_offered:
      paid_dollars: Number
      count: Number
    out_not_offered:
      paid_dollars: Number
      count: Number

  constraints:
    category:
      in: ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet']
    in:
      paid_dollars:
        between: [400000, 600000]
      count:
        between: [1, 100]
    out_offered:
      paid_dollars:
        between: [1200000, 1800000]
      count:
        between: [1, 100]
    out_not_offered:
      paid_dollars:
        between: [1200000, 1800000]
      count:
        between: [1, 100]


  constructor: ->
    @collection = _.times 6, (index) =>
      procedure_categories = @generate
      @generate(date: "2013#{month(index)}", procedure_categories: procedure_categories)
    @collection = @collection.concat _.times 6, (index) =>
      @generate(date: "2014#{month(index)}")

module.exports = ClaimCategory

month = (index) -> if ++index < 10 then '0' + index else index
