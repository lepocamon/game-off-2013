define ["engine/Sprite", "pixi"], (Sprite) ->

	class LoseScreen extends Sprite
		constructor: ->
			super "desert.png"

			@cat = new Sprite "parallaxcat.png"
			@cat.anchor.x = @cat.anchor.y = 0.5
			@cat.position.x = @width / 2
			@cat.position.y = @height / 2
			@addChild @cat

			textOptions = fill: "#FFD187", font: "bold 40px Calibri"

			message = new PIXI.Text "You lose", textOptions
			message.position.x = @width / 2 - message.width / 2
			message.position.y = @height / 2 - @cat.height / 2 - 55
			@addChild message

			restartMessage = new PIXI.Text "Press enter to restart", textOptions
			restartMessage.position.x = @width / 2 - restartMessage.width / 2
			restartMessage.position.y = @height - restartMessage.height - 20
			restartMessage.alpha = .5
			@addChild restartMessage

			@alpha = 0
			@lastUpdate = new Date()

		render: =>
			@cat.rotation += .001

			if @alpha >= 1 then return

			time = new Date()
			if time - @lastUpdate > 30
				@lastUpdate = time
				@alpha += .05