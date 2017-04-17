## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.
## You can use CoffeeScript in this file: http://coffeescript.org/
#markerArr = [
#  {
#    title: '名称：广州火车站'
#    point: '113.264531,23.157003'
#    address: '广东省广州市广州火车站'
#    tel: '12306'
#  }
#  {
#    title: '名称：广州塔（赤岗塔）'
#    point: '113.330934,23.113401'
#    address: '广东省广州市广州塔（赤岗塔） '
#    tel: '18500000000'
#  }
#  {
#    title: '名称：广州动物园'
#    point: '113.312213,23.147267'
#    address: '广东省广州市广州动物园'
#    tel: '18500000000'
#  }
#  {
#    title: '名称：天河公园'
#    point: '113.372867,23.134274'
#    address: '广东省广州市天河公园'
#    tel: '18500000000'
#  }
#]
#
#map_init = ->
#  `var point`
#  map = new (BMap.Map)('l-map')
#  # 创建Map实例
#  point = new (BMap.Point)(113.312213, 23.147267)
#  #地图中心点，广州市
#  map.centerAndZoom point, 13
#  # 初始化地图,设置中心点坐标和地图级别。
#  map.enableScrollWheelZoom true
#  #启用滚轮放大缩小
#  #向地图中添加缩放控件
#  ctrlNav = new (window.BMap.NavigationControl)(
#    anchor: BMAP_ANCHOR_TOP_LEFT
#    type: BMAP_NAVIGATION_CONTROL_LARGE)
#  map.addControl ctrlNav
#  #向地图中添加缩略图控件
#  ctrlOve = new (window.BMap.OverviewMapControl)(
#    anchor: BMAP_ANCHOR_BOTTOM_RIGHT
#    isOpen: 1)
#  map.addControl ctrlOve
#  #向地图中添加比例尺控件
#  ctrlSca = new (window.BMap.ScaleControl)(anchor: BMAP_ANCHOR_BOTTOM_LEFT)
#  map.addControl ctrlSca
#  point = new Array
#  #存放标注点经纬信息的数组
#  marker = new Array
#  #存放标注点对象的数组
#  info = new Array
#  #存放提示信息窗口对象的数组
#  i = 0
#  while i < markerArr.length
#    p0 = markerArr[i].point.split(',')[0]
#    #
#    p1 = markerArr[i].point.split(',')[1]
#    #按照原数组的point格式将地图点坐标的经纬度分别提出来
#    point[i] = new (window.BMap.Point)(p0, p1)
#    #循环生成新的地图点
#    marker[i] = new (window.BMap.Marker)(point[i])
#    #按照地图点坐标生成标记
#    map.addOverlay marker[i]
#    marker[i].setAnimation BMAP_ANIMATION_BOUNCE
#    #跳动的动画
#    label = new (window.BMap.Label)(markerArr[i].title, offset: new (window.BMap.Size)(20, -10))
#    marker[i].setLabel label
#    info[i] = new (window.BMap.InfoWindow)('<p style=’font-size:12px;lineheight:1.8em;’>' + markerArr[i].title + '</br>地址：' + markerArr[i].address + '</br> 电话：' + markerArr[i].tel + '</br></p>')
#    # 创建信息窗口对象
#    i++
#  marker[0].addEventListener 'mouseover', ->
#    @openInfoWindow info[0]
#    return
#  marker[1].addEventListener 'mouseover', ->
#    @openInfoWindow info[1]
#    return
#  marker[2].addEventListener 'mouseover', ->
#    @openInfoWindow info[2]
#    return
#  return
#
##异步调用百度js
#
#map_load = ->
#  load = document.createElement('script')
#  load.src = 'http://api.map.baidu.com/api?v=1.4&callback=map_init'
#  document.body.appendChild load
#  return
#
#window.onload = map_load