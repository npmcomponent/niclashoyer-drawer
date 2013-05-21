
# Drawer

Drawer navigation component. Supports vertical or horizontal drawers.

## Installation

    $ component install niclashoyer/drawer

## API

Drawer requires a basic HTML markup to function:

### Instantiation

#### Vertical

```html
<div id="drawer">
	<div class="drawers">
		<div class="left"></div>
		<div class="right"></div>
	</div>
	<div class="content"></div>
</div>
```

```javascript
var Drawer = require('drawer');
var el = document.getElementById('drawer');
var drawer = new Drawer(el);
```

#### Horizontal

If you want to use horizontal drawers just replace `left` and `right` with
`top` and `bottom` and tell drawer to use the `horizontal` direction:

```html
<div id="drawer">
	<div class="drawers">
		<div class="top"></div>
		<div class="bottom"></div>
	</div>
	<div class="content"></div>
</div>
```

```javascript
var Drawer = require('drawer');
var el = document.getElementById('drawer');
var drawer = new Drawer(el, 'horizontal');
```

#### Just one Side

If you want to use just one drawer (e.g. just `left` or just `bottom`) just
leave out the html element for it:

```html
<div id="drawer">
	<div class="drawers">
		<div class="left"></div>
	</div>
	<div class="content"></div>
</div>
```

### Open a Drawer

To open a drawer just call `drawLeft`, `drawRight` or `drawTop`, `drawBottom`.

```javascript
// vertical
drawer.drawLeft();
drawer.drawRight();

// horizontal
drawer.drawTop();
draewr.drawBottom();
```

### Closing a Drawer

To close a drawer just call `close`.

```javascript
drawer.close();
```

### Toggling a Drawer

It is also possible to toggle between open and close. Just use `toggleLeft`,
`toggleRight` and `toggleTop`, `toggleBottom` for that.

```javascript
// vertical
drawer.toggleLeft();
drawer.toggleRight();

// horizontal
drawer.toggleTop();
drawer.toggleBottom();
```

## Resizing

Drawer automatically binds itself to the `resize` event and will resize an
open drawer based on the drawer width.

## License

MIT
