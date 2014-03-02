dbg = debug(name = 'treeMap1Ctrl')

app.controller name, ($scope, dataSet) ->
  dbg 'data-set=%o', dataSet
  $scope.dataSet = dataSet

