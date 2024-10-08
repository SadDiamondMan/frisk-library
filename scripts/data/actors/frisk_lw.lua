local actor, super = Class(Actor, "frisk_lw")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Frisk"

    -- Width and height for this actor, used to determine its center
    self.width = 20
    self.height = 37

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    --
    --self.hitbox = {0, 25, 20, 14}

    self.hitbox = {0, 26.5, 20, 12}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 1, 0}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/frisk/light"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {
        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/spare", 1/15, false},
        ["battle/spell"]        = {"battle/spare", 1/15, false},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/spare", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attack_ready", 1/30, false},
        ["battle/act_ready"]    = {"battle/spare_02", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spare_02", 0.2, true},
        ["battle/item_ready"]   = {"battle/item_02", 0.2, false},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/spare_02", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hit", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/down", 1/15, false},

        ["battle/transition"]   = {"walk/right_1", 1/15, false},
        ["battle/intro"]        = {"battle/attack", 1/15, false},
        ["battle/victory"]      = {"walk/right_1", 1/10, false},

        -- Cutscene animations
        ["jump_fall"]           = {"fall", 1/5, true},
        ["jump_ball"]           = {"ball", 1/15, true},
    }

    -- Tables of sprites to change into in mirrors
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    local x, y = 0, 4

    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {1.5, 0},
        ["walk/right"] = {-2.5, 0},
        ["walk/up"] = {-1.5, 0},
        ["walk/down"] = {0, 0},

        ["walk_blush/down"] = {0, 0},

        ["slide"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {x, y},
        ["battle/attack_ready"] = {x, y},
        ["battle/hit"] = {x, y},
        ["battle/down"] = {x, y},
        ["battle/spare"] = {x, y},

        ["battle/idle"] = {x, y},

        ["battle/attack"] = {x, y},
        ["battle/attackready"] = {x, y},
        ["battle/act"] = {x, y},
        ["battle/actend"] = {x, y},
        ["battle/actready"] = {x, y},
        ["battle/item"] = {x, y},
        ["battle/itemready"] = {x, y},
        ["battle/defend"] = {x, y},

        ["battle/defeat"] = {x, y},
        ["battle/hurt"] = {x, y},

        ["battle/intro"] = {x, y},
        ["battle/victory"] = {x, y}
    }
end

return actor