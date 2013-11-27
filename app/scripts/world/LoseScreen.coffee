define ["engine/Sprite", "pixi"], (Sprite, PIXI) ->

	class LoseScreen extends Sprite
		constructor: ->
			super "desert.png"

			@cat = new Sprite("parallaxcat.png")
			@cat.anchor.x = @cat.anchor.y = 0.5
			@cat.position.x = @width / 2
			@cat.position.y = @height / 2
			@addChild @cat

			message = new PIXI.Text "You lose", { fill: "#FFD187", font: "bold 40px Calibri" }
			message.position.x = @width / 2 - message.width / 2
			message.position.y = @height / 2 - @cat.height / 2 - 55
			@addChild message

			@filters = [new PIXI.PixelateFilter()]

			@lastUpdate = new Date()

		render: =>
			@cat.rotation += .001

			if !@filters? then return

			time = new Date()
			if time - @lastUpdate > 30
				@lastUpdate = time
				pixelSize = @filters.first()
					.uniforms.pixelSize.value

				pixelSize.x--
				pixelSize.y--

				if pixelSize.x == 0
					@filters = null