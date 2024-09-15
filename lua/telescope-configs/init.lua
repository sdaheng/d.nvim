require'telescope'.setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fsc', function()
  builtin.grep_string({
    additional_args = function()
      return { '--type', 'c' }
    end
  })
end)

vim.keymap.set('n', '<leader>fgc', function()
  builtin.live_grep({
    additional_args = function()
      return { '--type', 'c' }
    end
  })
end)

