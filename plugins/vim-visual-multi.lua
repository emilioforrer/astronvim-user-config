return {
  "mg979/vim-visual-multi",
  config = function()
      vim.cmd [[
          " Plugin-specific configuration goes here
          let g:vim_visual_multi_leave_insert_mode = 1
      ]]
  end,
  event = "BufRead",
}