local role_map = {
    user = "human",
    assistant = "assistant",
    system = "system",
  }
  
  local parse_messages = function(opts)
    local messages = {
      { role = "system", content = opts.system_prompt },
    }
    vim
      .iter(opts.messages)
      :each(function(msg) table.insert(messages, { speaker = role_map[msg.role], text = msg.content }) end)
    return messages
  end
  
  local parse_response = function(data_stream, event_state, opts)
    if event_state == "done" then
      opts.on_complete()
      return
    end
  
    if data_stream == nil or data_stream == "" then return end
  
    local json = vim.json.decode(data_stream)
    local delta = json.deltaText
    local stopReason = json.stopReason
  
    if stopReason == "end_turn" then return end
  
    opts.on_chunk(delta)
  end
  
  ---@type AvanteProvider
  cody = {
    endpoint = "https://sourcegraph.com",
    model = "anthropic::2024-10-22::claude-3-5-sonnet-latest",
    api_key_name = "SRC_ACCESS_TOKEN",
    --- This function below will be used to parse in cURL arguments.
    --- It takes in the provider options as the first argument, followed by code_opts retrieved from given buffer.
    --- This code_opts include:
    --- - question: Input from the users
    --- - code_lang: the language of given code buffer
    --- - code_content: content of code buffer
    --- - selected_code_content: (optional) If given code content is selected in visual mode as context.
    ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
    parse_curl_args = function(opts, code_opts)
      local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "token " .. os.getenv(opts.api_key_name),
      }
  
      return {
        url = opts.endpoint .. "/.api/completions/stream?api-version=2&client-name=web&client-version=0.0.1",
        timeout = base.timeout,
        insecure = false,
        headers = headers,
        body = vim.tbl_deep_extend("force", {
          model = opts.model,
          temperature = 0,
          topK = -1,
          topP = -1,
          maxTokensToSample = 4000,
          stream = true,
          messages = M.parse_messages(code_opts),
        }, {}),
      }
    end,
    parse_response = parse_response,
    parse_messages = parse_messages,
  }

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
        --   opts.dual_boost = {
        --     enabled = false,
        --     first_provider = "openai",
        --     second_provider = "claude",
        --   }
          
        -- https://github.com/brewinski/avante.nvim/blob/feat/cody-provider/lua/avante/providers/cody.lua
        --   opts.provider = "cody"
        --   opts.cody = M
        --   opts.vendors = {
        --     ["cody"] = M
        --   }
          opts.provider = "openai"
          return opts
        end
      },
}