local actor, super = Class("YOU", "SFB/YOU")

function actor:init()
    super.init(self)

    self.width = 24
    self.height = 34

    self.hitbox = {0, 17, 24, 17}

    self.path = "SFB/party/you"
end

function actor:onWorldUpdate()
    super.super.onWorldUpdate(self)
end

function actor:onSetSprite(sprite, texture, callback)
    super.super.onSetSprite(self, sprite, texture, callback)
end

return actor