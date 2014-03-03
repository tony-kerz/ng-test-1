app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'tree-map-2',
      url: '/tree-map-2'
      templateUrl: 'tree-map-2/tree-map-2.html'
      controller: 'treeMap2Ctrl'
      resolve:
        dataSet: (dataService) ->
          dataService.dataSet2()
