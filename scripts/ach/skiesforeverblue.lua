local Ach, super = Class(Achievement)

function Ach:init()
    super:init(self)
    
    self.name = "Make the skies blue again" -- Display name

    self.icon = "achievements/dummy" -- Normal icon
    self.desc = "You saved the Girl from her broken game." -- Description
    self.hint = "A key may lead you to someone to save." -- If info hidden is true then this will show up in place of description, used for hints
    self.hidden = true -- Doesn't show up in the menu if not collected
    self.rarity = "Rare" -- An indicator on how difficult this achievement is. "Common", "Uncommon", "Rare", "Epic" "Legendary", "Unique", "Impossible"
    self.completion = false -- Shows a percent indicator if true, shows x/int if an integer, nothing if false.
end

return Ach