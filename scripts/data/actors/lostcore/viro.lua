local actor, super = Class("virovirokun", "viro")

function actor:init()
    super.init(self)

    self.name = "Viro"

    self.path = "battle/enemies/viro"
end

return actor