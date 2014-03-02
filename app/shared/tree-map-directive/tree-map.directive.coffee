dbg = debug(name = 'treeMapDirective')

app.directive name, ($window) ->
  restrict: 'E'
  scope:
    data: '='
  templateUrl: 'shared/tree-map-directive/tree-map.directive.html'
  controller: 'treeMapDirectiveCtrl'

  link: (scope, el, $attrs) ->
    dbg 'link: scope=%o, el=%o, $attrs=%o', scope, el, $attrs

    scope.vis =
      height: height(el)
      width: width(el)

    scope.$watch 'data', dataListener

    scope.rectStyle = rectStyle

    $window.onresize = ->
      dbg 'window-onresize'
      sizeListener el, scope
      scope.$apply()

height = (el) ->
  el.parent().prop('offsetHeight')

width = (el) ->
  el.parent().prop('offsetWidth')

sizeListener = (el, scope) ->
  h = height(el)
  w = width(el)
  vis = scope.vis
  unless (vis.height is h) and (vis.width is w)
    dbg "size-listener: height: #{vis.height} -> #{h}, width: #{vis.width} -> #{w}"
    scope.vis.height = h
    scope.vis.width = w
    calculateLayout scope

dataListener = (data, oldData, scope) ->
  dbg 'data-listener: data=%o, old-data=%o, scope=%o', data, oldData, scope
  calculateLayout scope

calculateLayout = (scope) ->
  vis = scope.vis
  vis.nodes = d3.layout.treemap().size([vis.width, vis.height]).nodes(scope.data)
  dbg 'calculate-layout: vis=%o', vis

rectStyle = (node) ->
  if node.children
    fill: colorScale(node.name)

colorScale = d3.scale.category20c()


