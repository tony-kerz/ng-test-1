Resource = require './resource'
Id = require './resource/id'

class ClaimSummaryBase extends Resource
  id: new Id

  collection: []

  schema:
    id: 'id'
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

module.exports = ClaimSummaryBase
