return {
	smw_secret_exit = function(cutscene, event)
		cutscene:text("* (It's a hole-looking hole.)")
		cutscene:text("* (For some reason,[wait:2] you feel like you can shove up an item in there.)")
		cutscene:text("* (Put the Blue Key in the hole?)")
		if cutscene:choicer({"Yes", "No"}) == 1 then
			local YOU = cutscene:getCharacter("YOU")
			local susie = cutscene:getCharacter("susie")

			cutscene:detachFollowers()

			Assets.playSound("item")
			Game.world.music:fade(0, 0.1)
			Game.world.map.ina:remove()

			local wait1, wait2 = cutscene:walkTo(YOU, 670, 665, 1, "up"), cutscene:walkTo(susie, 730, 665, 1, "up")
			cutscene:wait(function()
				return wait1() and wait2()
			end)
			cutscene:wait(0.5)

			cutscene:showNametag("Susie")
			cutscene:text("* Did you just put the key in this hole?", "nervous_side", "susie")
			cutscene:text("* What was even the point of that?", "nervous_side", "susie")
			cutscene:hideNametag()

			local keyhole = Sprite("world/keyhole", event.x+event.width/2, (event.y+event.height))
			keyhole:setOrigin(0.5, 1)
			keyhole:setScaleOrigin(0.5, 1)
			keyhole:setScale(0)
			keyhole:setLayer(YOU.layer - 0.1)
			Game.world:addChild(keyhole)

			local outline = Sprite("world/keyhole_outlines", 0, 0)
			--outline:setOrigin(0.5, 1)
			--outline:setScaleOrigin(0.5, 1)
			outline:setLayer(keyhole.layer)
			keyhole:addChild(outline)

			Assets.playSound("keyhole")

			YOU:setFacing("down")
			susie:setFacing("right")
			susie:setSprite("shock")

			local transition_done = false
			Game.world.timer:tween(1, keyhole, {scale_x = 2, scale_y = 2}, nil, function()
				Game.world.timer:tween(0.35, YOU, {y = 640})
				Game.world.timer:tween(0.35, susie, {y = 640})

				Game.world.timer:after(0.25, function()
					local mask = MaskFX(keyhole)
					YOU:addFX(mask)
					susie:addFX(mask)
					Game.world.timer:tween(1, keyhole, {scale_x = 0, scale_y = 0}, nil, function()
						transition_done = true
					end)
				end)
			end)

			cutscene:wait(function()
				return transition_done
			end)

			cutscene:wait(cutscene:fadeOut())
			cutscene:wait(1)

		else
			Assets.playSound("squeak")
		end
	end
}