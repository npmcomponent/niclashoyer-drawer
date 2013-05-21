
Drawer = require 'drawer'

drawer = new Drawer document.querySelector '.drawer'
window.drawer = drawer

toggleLeft = (e) ->
	drawer.toggleFirst()
	e.stopPropagation()
	e.preventDefault()

toggleRight = (e) ->
	drawer.toggleSecond()
	e.stopPropagation()
	e.preventDefault()

btnleft  = document.getElementById 'btnleft'
btnright = document.getElementById 'btnright'

btnleft.addEventListener 'click', toggleLeft
btnleft.addEventListener 'touchstart', toggleLeft

btnright.addEventListener 'click', toggleRight
btnright.addEventListener 'touchstart', toggleRight
