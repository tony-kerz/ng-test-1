module.exports = (server) ->
  (new (require './claim-summary.resource')).route server
  (new (require './claim-category.resource')).route server

