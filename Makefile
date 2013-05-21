
build: coffee components index.js drawer.css
	@component build --dev

coffee:
	coffee -c example/test.coffee index.coffee

components: component.json
	@component install --dev

clean:
	rm -fr build components template.js

.PHONY: clean
