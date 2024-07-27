return {
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = function(_, opts)

            -- https://github.com/lukas-reineke/indent-blankline.nvim/tree/master
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            
            
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            -- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/indent-blankline.lua
            -- opts.indent.highlight = highlight

            
            return opts
        end   
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = function(_, opts)
            opts.window.position = "right"
            return opts
        end   
    },
    {
        "AstroNvim/astrocore",
        opts = function(_, opts)
            -- Disable GuessIndent autocmd
            opts.autocmds.GuessIndent[1].callback = function(args) end
            opts.autocmds.GuessIndent[2].callback = function(args) end
            return opts
        end   
    }
}