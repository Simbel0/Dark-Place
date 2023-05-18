local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super:init(self)

    -- Enemy name
    self.name = "Viro"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("viro")

    -- Enemy health
    self.max_health = 480
    self.health = 480
    -- Enemy attack (determines bullet damage)
    self.attack = 8
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "...?"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "A virus even more sick than usual."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Viro remembers something and forgets it immediately.",
        "* Viro beeps a familliar tune.",
        "* Viro sees memories of the past.",
        "* Viro looks for something."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Viro will never remember."

    -- Register act called "Smile"
    self:registerAct("Remember")
    self:registerActFor("ralsei", "Cook")
    self:registerActFor("susie", "Cook")

    local act_leader = Game:getActLeader()
    if act_leader then
        self:registerActFor(act_leader.id, Game.battle.party[3].chara.name:sub(0, 1).."-Cook", "", {Game.battle.party[3].chara.id})
        self:registerActFor(act_leader.id, Game.battle.party[2].chara.name:sub(0, 1).."-Cook", "", {Game.battle.party[2].chara.id})
    end
end

function Dummy:onAct(battler, name)
    if name == "Smile" then
        -- Give the enemy 100% mercy
        self:addMercy(100)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "... ^^"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You smile.[wait:5]\n* The dummy smiles back.",
            "* It seems the dummy just wanted\nto see you happy."
        }

    elseif name == "Tell Story" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            enemy:setTired(true)
        end
        return "* You and Ralsei told the dummy\na bedtime story.\n* The enemies became [color:blue]TIRED[color:reset]..."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super:onAct(self, battler, name)
end

return Dummy