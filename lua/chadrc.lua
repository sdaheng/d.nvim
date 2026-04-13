
local M = {}

M.base46 = {
	theme = "donedark",
    hl_override = {
        ["@variable"] = {fg = "#abb2bf"},
        ["@variable.member"] = {fg = "#48b0bd"},
        ["@field"] = {fg = "#48b0bd"},
        ["@property"] = {fg = "#48b0bd"},
        ["@macro"] = {fg = "#48b0bd"},
    }
}

M.ui = {
    statusline = {
        enabled = false,
    },
    tabufline = {
        enabled = false,
    }
}

return M

