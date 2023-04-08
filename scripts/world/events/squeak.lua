local Squeak, super = Class(Event)

function Squeak:init(data)
    super.init(self, data)
end

function Squeak:onInteract(player, dir)
    if not Game.inventory:hasItem("sfb_key") then
        Assets.playSound("squeak")
    else
        Game.world:startCutscene("falling_skies.smw_secret_exit", self)
    end
    return true
end

return Squeak