local HisDoor, super = Class(Event)

function HisDoor:init(data)
    super.init(self, data)

    self.sprite = Sprite("world/events/his_door/closed")
    self.sprite:setScale(2)
    self:addChild(self.sprite)

    self.outline = Sprite("world/events/his_door/outline")
    self.outline:setScaleOrigin(0.5)
    self.outline:setPosition(self.outline.width/2, self.outline.height/2)
    self.scale_outline = 1
    self.outline:setScale(self.scale_outline)
    self.outline.alpha = 0
    self.outline:setLayer(WORLD_LAYERS["top"])
    self:addChild(self.outline)

    self.solid = true
end

function HisDoor:onInteract(player, dir)
    Game.world:startCutscene(function(cutscene)
        if Game.world.map.id:find("lostcore") then
            cutscene:text("* (The door is unlocked.)")
            cutscene:text("* (Return to the Dark Place?)")
            if cutscene:choicer({"Yes", "No"}) == 1 then
                for _,music in ipairs(Music.getPlaying()) do
                    music:fade(0, 20/30)
                end
                Assets.playSound("dooropen")
                self.sprite:setSprite("world/events/his_door/open")
                self.y = self.y - 5
                cutscene:wait(1)
                Assets.playSound("dtrans_lw")
                cutscene:wait(cutscene:fadeOut(3, {color={1, 1, 1}}))
                cutscene:loadMap("floor2/doors_right", "entry_lost", "down")
                cutscene:fadeIn(1)
            end
        else
            cutscene:text("* (The door is unlocked.)")
            cutscene:text("* (The idea of opening it makes you uneasy...)")
            cutscene:text("* (Open the door?)")
            if cutscene:choicer({"Yes", "No"}) == 1 then
                Game.world.camera.keep_in_bounds = false
                --Game.world.camera:setZoom(0.1)
                cutscene:detachCamera()
                cutscene:detachFollowers()
                for _,music in ipairs(Music.getPlaying()) do
                    music:fade(0, 20/30)
                end

                local x, y = self.x + self.width/2, self.y + self.height/2
                cutscene:panTo(x, Game.world.camera.y)
                pos = {
                    {x, y+100}
                }
                if #Game.party == 2 then
                    pos = {
                        {x-50, y+150},
                        {x+50, y+150}
                    }
                elseif #Game.party == 3 then
                    pos = {
                        {x-75, y+150},
                        {x, y+150},
                        {x+75, y+150}
                    }
                else
                    pos = {
                        {x-75, y+150},
                        {x-35, y+150},
                        {x+25, y+150},
                        {x+35, y+150}
                    }
                end

                local function partyDoneMoving(party_move)
                    local done = true
                    for i,mouv in ipairs(party_move) do
                        if not mouv() then
                            done = false
                            break
                        end
                    end
                    return done
                end

                local party_chara = {}
                for i,member in ipairs(Game.party) do
                    table.insert(party_chara, cutscene:getCharacter(member.id))
                end
                local party_move = {}
                for i,chara in ipairs(party_chara) do
                    table.insert(party_move, cutscene:walkTo(chara, pos[i][1], pos[i][2]-25, nil, "up", true))
                end
                cutscene:wait(function()
                    return partyDoneMoving(party_move)
                end)
                for i,chara in ipairs(party_chara) do
                    table.insert(party_move, cutscene:walkTo(chara, pos[i][1], pos[i][2], 1.5, "up", true))
                end
                cutscene:wait(function()
                    return partyDoneMoving(party_move)
                end)
                Assets.playSound("locker")
                self.sprite:setSprite("world/events/his_door/frame_black")
                Game.world.camera:shake(5, 0)
                cutscene:wait(1.5)
                for i,chara in ipairs(party_chara) do
                    table.insert(party_move, cutscene:walkTo(chara, x, y+self.height/2, 0.35, "up", true))
                end
                cutscene:wait(function()
                    return partyDoneMoving(party_move)
                end)
                Assets.playSound("dtrans_square")

                local default_layers = {}
                for i,chara in ipairs(party_chara) do
                    default_layers[i] = chara.layer
                    chara:setLayer(WORLD_LAYERS["top"] + 10)
                    table.insert(party_move, cutscene:walkTo(chara, pos[i][1], pos[i][2], 0.5, "up", true, "out-expo"))
                end
                
                self.outline.alpha = 1
                cutscene:wait(function()
                    self.scale_outline = self.scale_outline + 1 * DTMULT

                    self.outline:setScale(self.scale_outline)

                    return self.scale_outline >= 25
                end)
                local ambiance = Assets.playSound("dtrans_drone")
                local vol = 0
                cutscene:during(function()
                    if vol >= 1 then return false end
                    vol = vol + 0.01 * DTMULT
                    print(vol, ambiance:getVolume())
                    ambiance:setVolume(vol)
                end)
                local create_rect = Game.world.timer:everyInstant(0.75, function()
                    local rect = Rectangle(0, 0, 12, 10)
                    rect:setScaleOrigin(0.5)
                    rect:setColor(0.5, 0.5, 0.5, 1)
                    rect:setLayer(WORLD_LAYERS["top"] + 5)
                    Game.world:addChild(rect)
                    rect:setScreenPos(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)

                    Game.world.timer:tween(1.5, rect, {alpha=0, scale_x = 24, scale_y = 20}, nil, function()
                        rect:remove()
                    end)
                end, math.huge)
                cutscene:wait(3)
                vol = 1
                cutscene:during(function()
                    if vol <= 0 then return false end
                    vol = vol - 0.1 * DTMULT
                    ambiance:setVolume(vol)
                end)
                local lw = Assets.playSound("dtrans_lw")
                cutscene:wait(cutscene:fadeOut(3, {color={1, 1, 1}, global=true}))
                Game.world.timer:cancel(create_rect)
                cutscene:wait(function()
                    return not lw:isPlaying()
                end)
                for i,chara in ipairs(party_chara) do
                    chara:setLayer(0)
                end
                cutscene:wait(cutscene:fadeIn(3, {global=true}))
                cutscene:wait(1.5)
                cutscene:wait(cutscene:fadeOut(0))
                Game.world.camera.keep_in_bounds = true
                cutscene:loadMap("lostcore/start", "spawn")
                Game.world.music:play("lostcore", 0, 1)
                Game.world.music:fade(1, 2)
                cutscene:detachCamera()
                cutscene:detachFollowers()

                for i,member in ipairs(Game.party) do
                    local chara = cutscene:getCharacter(member.id)
                    if i == 1 then
                        chara:setPosition(310, 300)
                    elseif i == 2 then
                        chara:setPosition(260, 400)
                    elseif i == 3 then
                        chara:setPosition(400, 350)
                    elseif i == 4 then
                        chara:setPosition(240, 290)
                    end
                end

                cutscene:wait(cutscene:fadeIn(2))
                cutscene:wait(1)
                local susie = cutscene:getCharacter("susie")
                local dess = cutscene:getCharacter("dess")
                
                if susie then
                    susie:shake()
                    cutscene:wait(1)
                    cutscene:text("* Ugh... What the...", "annoyed", "susie")
                    cutscene:text("* ...", "shock", "susie")
                    if dess then
                        cutscene:text("* holy shit guys you'll never guess what I dreamt abo-", "condescending", "dess")
                        cutscene:text("* ...", "wtf", "dess")
                    end
                    cutscene:text("* YOU!! WAKE UP, YOU!!", "teeth", "susie")
                    cutscene:wait(1)
                    Assets.playSound("whip")
                    cutscene:text("* YOU WHERE THE HELL ARE WE??", "teeth", "susie")
                    if dess then
                        cutscene:text("* hell yeah you said the funny line!", "genuine", "dess")
                        cutscene:text("* Uh?", "sus_nervous", "susie")
                        cutscene:text("* The Kris where the hell are we line.")
                        cutscene:text("* Oh yeah, that.", "annoyed", "susie")
                        cutscene:text("* Anyway, YOU, do you know where we are?", "neutral", "susie")
                    end
                    Assets.playSound("frog")
                    cutscene:text("* I guess it means no.", "smirk", "susie")
                    cutscene:text("* Oh well, one way to know!", "sincere_smile", "susie")
                    cutscene:text("* Lead the way, YOU!", "sincere_smile", "susie")
                end

                cutscene:alignFollowers()
                cutscene:wait(cutscene:attachFollowers())
                cutscene:attachCameraImmediate()
            else
                cutscene:text("* (You feel better.)")
            end
        end
    end)
end

return HisDoor