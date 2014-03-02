module.exports = (server) ->
  (new (require './data')).route server

