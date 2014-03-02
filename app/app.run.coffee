dbg = debug('app')

app.run ($rootScope, $state, $stateParams, flash) ->
  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
    dbg '$stateChangeStart: event=%o, toState=%o, toParams=%o, fromState=%o, fromParams=%o', event, toState, toParams, fromState, fromParams

  $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
    dbg '$stateChangeSuccess: event=%o, toState=%o, toParams=%o, fromState=%o, fromParams=%o', event, toState, toParams, fromState, fromParams

  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    dbg '$stateChangeError: event=%o, toState=%o, toParams=%o, fromState=%o, fromParams=%o, error=%o', event, toState, toParams, fromState, fromParams, error
    flash.error = "encountered error-code=[#{error.status}] attempting to change from state=[#{fromState.name}] to state=[#{toState.name}]"


