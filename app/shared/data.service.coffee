app.service 'dataService', ($http) ->
  index: ->
    @index ?= $http.get('/api/data').then dataSuccess, dataFailure

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

  dataSet2: ->
    @dataSet2 ?= $http.get('/api/data').then dataSuccess, dataFailure

dataSuccess = (resolution) ->
  resolution.data

dataFailure = (rejection) ->
  console.log "rejection: #{rejection}"
  rejection



