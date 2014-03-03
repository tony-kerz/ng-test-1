dbg = debug(name = 'treeMap2Ctrl')

app.controller name, ($scope, dataSet) ->
  dbg 'data-set=%o', dataSet
  $scope.dataSet = dataSet

