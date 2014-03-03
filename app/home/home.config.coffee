app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'home',
      url: '/home'
      templateUrl: 'home/home.html'
      #controller: 'treeMap1Ctrl'
