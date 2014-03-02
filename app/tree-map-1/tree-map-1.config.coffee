app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'tree-map-1',
      url: '/tree-map-1'
      templateUrl: 'tree-map-1/tree-map-1.html'
      controller: 'treeMap1Ctrl'
      resolve:
        dataSet: (dataService) ->
          dataService.dataSet1()()
