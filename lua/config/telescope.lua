-- toggle between hidden files and not hidden files using <C-h> in find_files
local my_find_files
my_find_files = function(opts, no_ignore)
  opts = opts or {}
  no_ignore = vim.F.if_nil(no_ignore, false)
  opts.attach_mappings = function(_, map)
    map({ 'n', 'i' }, '<C-h>', function(prompt_bufnr) -- <C-h> to toggle modes
      local prompt = require('telescope.actions.state').get_current_line()
      require('telescope.actions').close(prompt_bufnr)
      no_ignore = not no_ignore
      my_find_files({ default_text = prompt }, no_ignore)
    end)
    return true
  end

  if no_ignore then
    opts.no_ignore = true
    opts.hidden = true
    opts.prompt_title = 'Find Files <ALL>'
    require('telescope.builtin').find_files(opts)
  else
    opts.prompt_title = 'Find Files'
    require('telescope.builtin').find_files(opts)
  end
end

-- toggle between hidden files and not hidden files using <C-h> in live_grep
local my_live_grep
my_live_grep = function(opts, no_ignore)
  opts = opts or {}
  no_ignore = vim.F.if_nil(no_ignore, false)
  opts.attach_mappings = function(_, map)
    map({ 'n', 'i' }, '<C-h>', function(prompt_bufnr) -- <C-h> to toggle modes
      local prompt = require('telescope.actions.state').get_current_line()
      require('telescope.actions').close(prompt_bufnr)
      no_ignore = not no_ignore
      my_live_grep({ default_text = prompt }, no_ignore)
    end)
    return true
  end

  if no_ignore then
    opts.no_ignore = true
    opts.hidden = true
    opts.prompt_title = 'Live Grep <ALL>'
    require('telescope.builtin').live_grep(opts)
  else
    opts.prompt_title = 'Live Grep'
    require('telescope.builtin').live_grep(opts)
  end
end

vim.keymap.set('n', '<leader>/', my_live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader><leader>', my_find_files, { desc = '[S]earch [F]iles' })
