-- ---------------------- SHARED NEOVIM SETTINGS ------------------------------

-- Configuration

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.exrc = true
vim.o.secure = true
vim.opt.clipboard = "unnamedplus"

-- ---------------------- Keybindings ------------------------------

-- Unindent code with Shift + Tab in insert mode
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })

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

-- Cut text and copy to clipboard
-- Key mapping for visual mode to cut text and copy to clipboard
vim.api.nvim_set_keymap("v", "<C-x>", '"+d', { noremap = true, silent = true })


-- Change without copy
vim.api.nvim_set_keymap("n", "<A-c>", '"_c', { noremap = true })
vim.api.nvim_set_keymap("n", "<A-C>", '"_C', { noremap = true })

-- Delete without copy
vim.api.nvim_set_keymap("n", "<A-d>", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "<A-D>", '"_D', { noremap = true })
vim.api.nvim_set_keymap("n", "<A-dd>", '"_dd', { noremap = true })

vim.api.nvim_set_keymap("v", "<A-d>", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "<A-D>", '"_D', { noremap = true })
vim.api.nvim_set_keymap("v", "<A-dd>", '"_dd', { noremap = true })


vim.api.nvim_set_keymap("n", "<BS>", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "<BS>", '"_d', { noremap = true })

-- Change without copy
-- vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<S-c>", '"_C', { noremap = true })

-- Delete without copy
-- vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<S-d>", '"_D', { noremap = true })
-- vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true })


-- vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<S-d>", '"_D', { noremap = true })
-- vim.api.nvim_set_keymap("v", "dd", '"_dd', { noremap = true })

-- -- Copy to clipboard
-- vim.api.nvim_set_keymap("n", "<leader>Y", '"+y', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>YY", '"+yg_', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<leader>Y", '"+y', { noremap = true })

-- -- Paste from clipboard
-- vim.api.nvim_set_keymap("n", "<leader>PP", '"+P', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<leader>PP", '"+p', { noremap = true })


-- Some ThePrimeagen binds
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', opts)
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', opts)
vim.api.nvim_set_keymap('n', 'Q', '<nop>', opts)


if vim.g.vscode then
  -- ---------------------- VSCODE NEOVIM SETTINGS------------------------------
  -- VSCode extension
  -- vim.api.nvim_set_keymap('n', '?', "<Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': vim.fn.expand('<cword>')})<CR>", { noremap = true, silent = true })

else
  -- ---------------------- NEOVIM ONLY SETTINGS------------------------------

  -- Set indentation per language

  -- Function to set tab settings for Go files
  local function set_go_tabs()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = false
  end

  -- Function to set tab settings for Python files
  local function set_python_tabs()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end

  -- Create an autocommand group for Go and Python settings
  vim.api.nvim_create_augroup('ProgrammingSettings', { clear = true })

  -- Apply the tab settings for Go files
  vim.api.nvim_create_autocmd('FileType', {
    group = 'ProgrammingSettings',
    pattern = 'go',
    callback = set_go_tabs,
  })

  -- Apply the tab settings for Python files
  vim.api.nvim_create_autocmd('FileType', {
    group = 'ProgrammingSettings',
    pattern = 'python',
    callback = set_python_tabs,
  })

  -- Keybindings for multicursor
  vim.api.nvim_set_keymap("n", "<C-n>", "<Plug>(multicursor-next)", {})
  vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>(multicursor-prev)", {})
  vim.api.nvim_set_keymap("n", "<C-b>", "<C-V>", { noremap = true })

  -- Icon picker
  -- vim.api.nvim_set_keymap("n", "<C-i>", "<cmd>IconPickerNormal<cr>", opts)
  vim.api.nvim_set_keymap("n", "<C-\\><C-i>", "<cmd>IconPickerYank<cr>", opts)
  vim.api.nvim_set_keymap("i", "<C-\\><C-i>", "<cmd>IconPickerInsert<cr>", opts)
  
  -- Enable list mode to show whitespace characters
  vim.opt.list = true

  -- Define the symbols for whitespace characters
  vim.opt.listchars = {
      space = '·',       -- Character to show for space
      tab = '→ ',        -- Character to show for tab
      trail = '•',       -- Character to show for trailing spaces
      eol = '↲',         -- Character to show for end of line
  }

  -- Optionally, you can customize the appearance of the whitespace characters using highlight groups
  -- For example, to change the color of the whitespace characters:
  vim.cmd('highlight SpecialKey ctermfg=darkgray guifg=darkgray')
  vim.cmd('highlight NonText ctermfg=darkgray guifg=darkgray')
  vim.cmd('highlight EndOfBuffer ctermfg=darkgray guifg=darkgray')

  -- Function to enable list mode
  local function enable_list_mode()
    vim.opt.list = true
  end

  -- Function to disable list mode
  local function disable_list_mode()
    vim.opt.list = false
  end

  -- Autocommands to toggle list mode based on the mode
  vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    callback = disable_list_mode
  })

  vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    callback = enable_list_mode
  })

  -- Initially enable list mode when starting in normal mode
  enable_list_mode()

end

return {

} 



