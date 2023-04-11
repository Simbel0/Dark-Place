local actor, super = Class("susie", "SFB/susie")

function actor:init()
    super.init(self)

    self.width = 28
    self.height = 38

    self.hitbox = {0, 19, 28, 19}

    self.path = "SFB/party/susie"
end

function actor:onWorldUpdate()
    super.super.onWorldUpdate(self)
end

function actor:onSetSprite(sprite, texture, callback)
    super.super.onSetSprite(self, sprite, texture, callback)
end

return actor