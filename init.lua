-- Configuration

vim.o.exrc = true
vim.o.secure = true
vim.opt.clipboard = "unnamedplus"

-- ---------------------- Keybindings ------------------------------

vim.api.nvim_set_keymap("n", "<C-n>", "<Plug>(multicursor-next)", {})
vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>(multicursor-prev)", {})
vim.api.nvim_set_keymap("n", "<C-b>", "<C-V>", { noremap = true })

-- Mapping for CTRL+a to select all text in normal, insert, and visual mode
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true })

-- Change Crtl c to copy to clipboard
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+yiw`^i', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-C>', '<Esc>"+yiw`^i', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', opts)


-- Change without copy
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true })
vim.api.nvim_set_keymap("n", "<S-c>", '"_C', { noremap = true })

-- Delete without copy
-- vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<S-d>", '"_D', { noremap = true })
-- vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true })
vim.api.nvim_set_keymap("n", "<BS>", '"_d', { noremap = true })

-- vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<S-d>", '"_D', { noremap = true })
-- vim.api.nvim_set_keymap("v", "dd", '"_dd', { noremap = true })
vim.api.nvim_set_keymap("v", "<BS>", '"_d', { noremap = true })

-- Copy to clipboard
vim.api.nvim_set_keymap("n", "<leader>Y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>YY", '"+yg_', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>Y", '"+y', { noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>PP", '"+P', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>PP", '"+p', { noremap = true })

-- Icon picker
-- vim.api.nvim_set_keymap("n", "<C-i>", "<cmd>IconPickerNormal<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-\\><C-i>", "<cmd>IconPickerYank<cr>", opts)
vim.api.nvim_set_keymap("i", "<C-\\><C-i>", "<cmd>IconPickerInsert<cr>", opts)

-- Some ThePrimeagen binds
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', opts)
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', opts)
vim.api.nvim_set_keymap('n', 'Q', '<nop>', opts)


-- ---------------------- Keybindings ------------------------------
if vim.g.vscode then
  -- VSCode extension
  -- vim.api.nvim_set_keymap('n', '?', "<Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': vim.fn.expand('<cword>')})<CR>", { noremap = true, silent = true })

else
  -- ordinary Neovim
end

return {

} 



