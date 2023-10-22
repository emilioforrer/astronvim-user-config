-- Configuration

vim.o.exrc = true
vim.o.secure = true
vim.opt.clipboard = "unnamedplus"


-- ---------------------- Keybindings ------------------------------

vim.api.nvim_set_keymap('n', '<C-n>', '<Plug>(multicursor-next)', {})
vim.api.nvim_set_keymap('n', '<C-p>', '<Plug>(multicursor-prev)', {})

local opts = { noremap = true, silent = true }

-- Copy to clipboard
vim.api.nvim_set_keymap("n", "<leader>Y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>YY", '"+yg_', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>Y", '"+y', { noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>PP", '"+P', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>PP", '"+p', { noremap = true })

-- Icon picker
vim.api.nvim_set_keymap('n', '<Leader><Leader>i', '<cmd>IconPickerNormal<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader><Leader>y', '<cmd>IconPickerYank<cr>', opts)
vim.api.nvim_set_keymap('i', '<C-i>', '<cmd>IconPickerInsert<cr>', opts)

return {
  plugins = {
    "AstroNvim/astrocommunity",
    -- { import = "astrocommunity.pack.bash" },
    -- { import = "astrocommunity.pack.docker" },
    -- { import = "astrocommunity.pack.cue" },
    { import = "astrocommunity.pack.go" },
    -- { import = "astrocommunity.pack.helm" },
    -- { import = "astrocommunity.pack.html-css" },
    -- { import = "astrocommunity.pack.json" },
    -- { import = "astrocommunity.pack.lua" },
    -- { import = "astrocommunity.pack.markdown" },
    -- { import = "astrocommunity.pack.nix" },
    { import = "astrocommunity.pack.python" },
    -- { import = "astrocommunity.pack.ruby" },
    { import = "astrocommunity.pack.rust" },
    -- { import = "astrocommunity.pack.svelte" },
    -- { import = "astrocommunity.pack.tailwindcss" },
    -- { import = "astrocommunity.pack.terraform" },
    -- { import = "astrocommunity.pack.toml" },
    -- { import = "astrocommunity.pack.typescript-all-in-one" },
    -- { import = "astrocommunity.pack.vue" },
    -- { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.rose-pine" },
    { import = "astrocommunity.colorscheme.catppuccin" },
  }
}