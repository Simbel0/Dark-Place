local character, super = Class("susie", true)

function character:init()
    super.init(self)

    self:addSpell("pacify")
end

function character:getActor(light)
    if (Game.world and Game.world.map) and Game.world.map.id:find("SFB/") then
        return "SFB/susie"
    else
        return super.getActor(self, light)
    end
end

return character