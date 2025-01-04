-- --- Documentation for setting up Sourcegraph Cody
-- --- Generating an access token: https://sourcegraph.com/docs/cli/how-tos/creating_an_access_token

-- local P = require("avante.providers")
-- local Utils = require("avante.utils")

-- ---@class AvanteProviderFunctor
-- local M = {}

-- M.api_key_name = "SRC_ACCESS_TOKEN"
-- M.role_map = {
--   user = "human",
--   assistant = "assistant",
--   system = "system",
-- }

-- M.parse_messages = function(opts)
--   local messages = {
--     { role = "system", content = opts.system_prompt },
--   }
--   vim
--     .iter(opts.messages)
--     :each(function(msg) table.insert(messages, { speaker = M.role_map[msg.role], text = msg.content }) end)
--   return messages
-- end

-- M.parse_response = function(data_stream, event_state, opts)
--   -- vim.api.nvim_notify(vim.inspect(data_stream) .. "\n\n\n\n", 1, {})
--   if event_state == "done" then
--     opts.on_complete()
--     return
--   end

--   if data_stream == nil or data_stream == "" then return end

--   local json = vim.json.decode(data_stream)
--   local delta = json.deltaText
--   local stopReason = json.stopReason

--   if stopReason == "end_turn" then return end

--   opts.on_chunk(delta)
-- end

-- ---@param provider AvanteProviderFunctor
-- ---@param code_opts AvantePromptOptions
-- ---@return table
-- M.parse_curl_args = function(provider, code_opts)
--   local base, body_opts = P.parse_config(provider)

--   local api_key = provider.parse_api_key()
--   if api_key == nil then
--     -- if no api key is available, make a request with a empty api key.
--     api_key = ""
--   end

--   local headers = {
--     ["Content-Type"] = "application/json",
--     ["Authorization"] = "token " .. api_key,
--   }

--   return {
--     url = Utils.trim(base.endpoint, { suffix = "/" })
--       .. "/.api/completions/stream?api-version=2&client-name=web&client-version=0.0.1",
--     timeout = base.timeout,
--     insecure = false,
--     headers = headers,
--     body = vim.tbl_deep_extend("force", {
--       model = base.model,
--       temperature = body_opts.temperature,
--       topK = body_opts.topK,
--       topP = body_opts.topP,
--       maxTokensToSample = body_opts.max_tokens,
--       stream = true,
--       messages = M.parse_messages(code_opts),
--     }, {}),
--   }
-- end

-- M.on_error = function() end

-- M.endpoint = "https://sourcegraph.com"
-- M.model = "anthropic::2024-10-22::claude-3-5-sonnet-latest"
-- M.timeout = 30000
-- M.max_tokens = 4000
-- M.temperature = 0
-- M.stream = true
-- M.topK = -1
-- M.topP = -1


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


            opts.indent.char = "▏"
            opts.indent.tab_char = "▏"
            
            
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
    },
    {
        "yetone/avante.nvim",
        opts = function(_, opts)
          

          opts.provider = "openai"

          --   opts.dual_boost = {
          --     enabled = false,
          --     first_provider = "openai",
          --     second_provider = "claude",
          --   }
          
          -- https://github.com/brewinski/avante.nvim/blob/feat/cody-provider/lua/avante/providers/cody.lua
          -- opts.provider = "cody"

          -- opts.cody = {}

          -- opts.vendors = {
          --   ["cody"] = M
          -- }
          
          return opts
        end
      },
}