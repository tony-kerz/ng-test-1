app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'simple-1',
      url: '/simple-1'
      templateUrl: 'simple-1/simple-1.html'
      controller: 'simple1Ctrl'
