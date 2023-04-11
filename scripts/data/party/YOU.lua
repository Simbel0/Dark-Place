local character, super = Class("YOU", true)

function character:init()
    super.init(self)

    self.max_stats = {}
end

function character:onLevelUpLVLib()
    self:increaseStat("health", 10)
    self:increaseStat("attack", 1)
    self:increaseStat("defense", 2)
end

function character:getActor(light)
    if (Game.world and Game.world.map) and Game.world.map.id:find("SFB/") then
        return "SFB/YOU"
    else
        return super.getActor(self, light)
    end
end

return character