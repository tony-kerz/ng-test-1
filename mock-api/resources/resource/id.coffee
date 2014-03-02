module.exports = class Id
  count: 0

  generate: ->
    String ++@count

  current: ->
    String @count
