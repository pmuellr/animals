COFFEE = ./node_modules/.bin/coffee

all: setup.txt
	@node      animals-1.js
	@node      animals-2.js
	@node      animals-3.js
	@${COFFEE} animals-1.coffee
	@${COFFEE} animals-2.coffee
	@${COFFEE} animals-3.coffee
	
setup.txt:
	@echo "this directory has been setup" > setup.txt
	@npm install coffee-script
