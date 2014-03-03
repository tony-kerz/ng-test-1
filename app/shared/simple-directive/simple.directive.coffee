dbg = debug(name = 'simpleDirective')

app.directive name, ($window) ->
  restrict: 'E'
  scope:
    data: '='
  templateUrl: 'shared/simple-directive/simple.directive.html'
  controller: 'simpleDirectiveCtrl'

  link: (scope, el, $attrs) ->
    dbg 'link: scope=%o, el=%o, el-parent=%o, $attrs=%o', scope, el, el.parent(), $attrs

    scope.vis =
      height: height(el)
      width: width(el)
      x: 0
      y: 0

    $window.onresize = ->
      dbg 'window-onresize: el=%o', el
      sizeListener el, scope
      scope.$apply()

height = (el) ->
  h = el.prop('offsetHeight')
  dbg "height=#{h}"
  #300
  h

width = (el) ->
  el.prop('offsetWidth')

sizeListener = (el, scope) ->
  h = height(el)
  w = width(el)
  vis = scope.vis
  unless (vis.height is h) and (vis.width is w)
    dbg "size-listener: height: #{vis.height} -> #{h}, width: #{vis.width} -> #{w}"
    vis.height = h
    vis.width = w


