local character, super = Class(PartyMember, "kangel")

function character:init()
    super.init(self)

    self.name = "KAngel"

    self:setActor("noelle")
    self:setLightActor("noelle_lw")

    self.level = 2
    self.title = "Internet Angel\nParasocialism\nat its finest"

    self.soul_priority = 1
    self.soul_color = {1, 0, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "Ka-Action"

	self:addSpell("angel_blessing")
    self:addSpell("angel_beam")
    self:addSpell("nerdattack")

    self.health = 100

    self.stress = 10
    self.mental = 10

    self.stats = {
        health = 100,
        attack = 3,
        defense = 5,
        magic = 2,
        stress = 100,
        mental = 100
    }

    self.lw_stats = {
        health = 20,
        attack = 1,
        defense = 1,
        stress = 100,
        mental = 100
    }

    self:setWeapon("wood_blade")

    self.weapon_icon = "ui/menu/equip/knife"

    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {178/255, 221/255, 1}
    --self.dmg_color = {239, 228, 176}
    --self.attack_bar_color = {239, 228, 176}
    --self.attack_box_color = {239, 228, 176}
    --self.xact_color = {239, 228, 176}

    self.menu_icon = "party/kangel/head"
    self.head_icons = "party/kangel/icons"
    --self.name_sprite = "party/noelle/name"

    self.attack_sprite = "effects/attack/angel"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1.5

    self.battle_offset = {3, 9}
    self.head_icon_offset = {-7, -3}
    self.menu_icon_offset = nil

    self.gameover_message = "Wake up, punk!"

    self.followers = love.math.random(10000, 1000000)
end

function character:getName()
    return Game:isLight() and "Ame-chan" or "KAngel"
end

function character:getGameOverMessage()
    -- Her message would definitely changed based on her stress and mental darkness
    return self.gameover_message
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:onLevelUpLVLib()
    self:increaseStat("health", 10)
    self:increaseStat("attack", 3)
    self:increaseStat("defense", 1)
    self:increaseStat("magic", 1)
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1  then
        local icon = Assets.getTexture("ui/menu/icon/camera")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Followers:", x, y, 0, 0.8, 1)
        love.graphics.print(self.followers, x+130, y, 0, 0.6, 1)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/lollipop")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Cute:", x, y)
        local cute_text = "Yes"
        if self.stress/100 > 0.8 and Utils.random(0, 100-self.stress-10)<10 then cute_text = "No!!"
        elseif Utils.random()<0.1 then cute_text = "Yes?" end
        love.graphics.print(cute_text, x+130, y, 0)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Overload:", x, y, 0, 0.8, 1)

        love.graphics.print("Fine", x+130, y)
        return true
    end
end

return character