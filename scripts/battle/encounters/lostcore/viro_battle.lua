local Viro, super = Class(Encounter)

function Viro:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Viro doesn't know why it's here."

    -- Battle music ("battle" is rude buster)
    self.music = nil
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("viro")
end

return Viro