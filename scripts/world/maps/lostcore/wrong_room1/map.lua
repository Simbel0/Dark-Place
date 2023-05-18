local Room1, super = Class(Map)

function Room1:onEnter()
    super.onEnter(self)
	Game.world:startCutscene(function(cutscene)
		local viro = cutscene:getCharacter("viro")
		if viro then
			Assets.playSound("alert")
			cutscene:wait(1)
			cutscene:startEncounter("lostcore/viro_battle", true, viro)
			viro:setFlag("dont_load", true)
			viro:fadeOutAndRemove()
		end
	end)
end

return Room1