require.config
	paths:
		jquery: "../bower_components/jquery/jquery"
		pixi: "../bower_components/pixi/bin/pixi"
		buzz: "../bower_components/buzz/dist/buzz"
		bootstrapAffix: "../bower_components/sass-bootstrap/js/affix"
		bootstrapAlert: "../bower_components/sass-bootstrap/js/alert"
		bootstrapButton: "../bower_components/sass-bootstrap/js/button"
		bootstrapCarousel: "../bower_components/sass-bootstrap/js/carousel"
		bootstrapCollapse: "../bower_components/sass-bootstrap/js/collapse"
		bootstrapDropdown: "../bower_components/sass-bootstrap/js/dropdown"
		bootstrapModal: "../bower_components/sass-bootstrap/js/modal"
		bootstrapPopover: "../bower_components/sass-bootstrap/js/popover"
		bootstrapScrollspy: "../bower_components/sass-bootstrap/js/scrollspy"
		bootstrapTab: "../bower_components/sass-bootstrap/js/tab"
		bootstrapTooltip: "../bower_components/sass-bootstrap/js/tooltip"
		bootstrapTransition: "../bower_components/sass-bootstrap/js/transition"

	shim:
		bootstrapAffix:
			deps: ["jquery"]

		bootstrapAlert:
			deps: ["jquery", "bootstrapTransition"]

		bootstrapButton:
			deps: ["jquery"]

		bootstrapCarousel:
			deps: ["jquery", "bootstrapTransition"]

		bootstrapCollapse:
			deps: ["jquery", "bootstrapTransition"]

		bootstrapDropdown:
			deps: ["jquery"]

		bootstrapModal:
			deps: ["jquery", "bootstrapTransition"]

		bootstrapPopover:
			deps: ["jquery", "bootstrapTooltip"]

		bootstrapScrollspy:
			deps: ["jquery"]

		bootstrapTab:
			deps: ["jquery", "bootstrapTransition"]

		bootstrapTooltip:
			deps: ["jquery", "bootstrapTransition"]

		bootstrapTransition:
			deps: ["jquery"]

require ["engine/Resolution", "world/World", "morphtocat"], (Resolution, World, Morphtocat) ->
	"use strict"

	window.initGame = =>
		world = new World new Resolution(1000, 512), 0x0
		$("#game").children().remove()
		$("#game").append world.view()
		window.morphtocat = new Morphtocat world

	initGame()