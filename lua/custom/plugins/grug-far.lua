vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>sr', '<CMD>:GrugFar<CR>', { desc = 'search and replace' })

return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }
  end,
}
