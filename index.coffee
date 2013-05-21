
css = require 'css'

addDrawerStyles = (drawer, direction) ->
	styles = {}
	switch direction
		when 'left'
			styles.left   = 0
			styles.right  = 'auto'
		when 'right'
			styles.right = 0
			styles.left  = 'auto'
		when 'top'
			styles.top    = 0
			styles.bottom = 'auto'
		when 'bottom'
			styles.bottom = 0
			styles.top    = 'auto'
	switch direction
		when 'left', 'right'
			styles.height    = '100%'
			styles.maxHeight = 'none'
			styles.minHeight = 'none'
		when 'top', 'bottom'
			styles.width    = '100%'
			styles.maxWidth = 'none'
			styles.minWidth = 'none'
	css drawer, styles

class Drawer
	
	constructor: (@root, direction = 'vertical') ->
		
		if direction is 'vertical'
			first  = 'left'
			second = 'right'
			@drawerProps =
				size:   'width'
				change: 'left'
		else
			first  = 'top'
			second = 'bottom'
			@drawerProps =
				size:   'height'
				change: 'top'
		
		@_findElements first, second
		
		if @drawer1?
			addDrawerStyles @drawer1, first
		if @drawer2?
			addDrawerStyles @drawer2, second
		
		@active = null
		
		addEventListener 'resize', =>
			@update()
	
	_findElements: (first, second) ->
		@drawers = @root.querySelector '.drawers'
		@drawer1 = @drawers.querySelector '.' + first
		@drawer2 = @drawers.querySelector '.' + second
		@content = @root.querySelector '.content'
	
	_getDrawerStyle: (drawer, prefix = '') ->
		styles = {}
		styles[@drawerProps.change] = prefix + getComputedStyle(drawer)[@drawerProps.size]
		styles
	
	_draw: (first, second, prefix) ->
		if first?
			css @content, @_getDrawerStyle first, prefix
			if second?
				second.classList.remove 'active'
			first.classList.add     'active'
			@active = first
			this
	
	drawFirst: ->
		@_draw @drawer1, @drawer2
	
	drawSecond: ->
		@_draw @drawer2, @drawer1, '-'
	
	close: ->
		css @content,
			left: 0
			top:  0
		@drawer1?.classList.remove 'active'
		@drawer2?.classList.remove 'active'
		@active = null
		this
	
	_toggle: (first, second, prefix) ->
		if @active is first
			@close()
		else
			@_draw first, second, prefix
	
	toggleFirst: ->
		@_toggle @drawer1, @drawer2
	
	toggleSecond: ->
		@_toggle @drawer2, @drawer1, '-'
	
	update: ->
		if @active isnt null
			if @active is @drawer1
				@drawFirst()
			else
				@drawSecond()
	
	# alias
	drawLeft:    @::drawFirst
	drawRight:   @::drawSecond
	drawTop:     @::drawFirst
	drawBottom:   @::drawSecond
	toggleLeft:   @::toggleFirst
	toggleRight:  @::toggleSecond
	toggleTop:    @::toggleFirst
	toggleBottom: @::toggleSecond

module.exports = Drawer
