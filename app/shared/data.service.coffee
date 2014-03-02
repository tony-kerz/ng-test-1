app.service 'dataService', ($http) ->
  index: ->
    @index ?= $http.get('/api/data').then indexSuccess, indexFailure

  dataSet1: ->
    @dataSet1 ?=
      name: 'flare'
      children: [
        name: 'analytics'
        children: [
          name: 'cluster'
          children: [
            name: 'AgglomerativeCluster'
            value: 3938
          ,
            name: 'CommunityStructure'
            value: 3812
          ,
            name: 'MergeEdge'
            value: 743
          ]
        ,
          name: 'graph'
          children: [
            name: 'BetweennessCentrality'
            value: 3534
          ,
            name: 'LinkDistance'
            value: 5731
          ]
        ]
      ]

indexSuccess = (resolution) ->
  resolution.data

indexFailure = (rejection) ->
  console.log "rejection: #{rejection}"
  rejection



