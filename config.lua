Config = {}

Config.Locale = 'en'

Config.ncps = {
    [1] = {
        coords = vector4(319.6, -701.16, 28.36, 242.56),  -- coords of the npc
        textcoords = vector3(319.6, -701.16, 29.56), -- basically the same coord just couldnt think of a better solution
        model = "s_f_y_scrubs_01", --model of the npc
        cost = 350, -- cost to revive
        text = "[~r~E~w~] - Revive", -- the 'help text'
        bedcoords = vector4(320.72, -699.08, 29.32, 16.08), -- the coordinates of the place where the revive process takes place (like a hospital bed)
    },
    [2] = {
        coords = vector4(246.92, -1154.16, 29.24, 231.8), -- coords of the npc
        textcoords = vector3(246.92, -1154.16, 29.24), -- basically the same coord just couldnt think of a better solution
        model = "s_f_y_scrubs_01", --model of the npc
        cost = 450, -- cost to revive
        text = "[~r~E~w~] - Revive", -- the 'help text'
        bedcoords = vector4(254.48, -1159.08, 29.2, 242.36), -- the coordinates of the place where the revive process takes place (like a hospital bed)
    },
}

Config.ambulanceJobs = { -- if there is anyone online from these jobs, the healer npcs won't be spawned
    ["ambulance"] = true,
}