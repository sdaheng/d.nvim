require'telescope'.setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
})

local builtin = require('telescope.builtin')

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")

  if #text > 0 then
	return text
  else
	return ''
  end
end


vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('v', '<leader>fs', function()

  local selected_text = vim.getVisualSelection() 

  builtin.grep_string({
    search = selected_text
  })
end)


vim.keymap.set('n', '<leader>fsc', function()
  builtin.grep_string({
    additional_args = function()
      return { '--type', 'c' }
    end
  })
end)

vim.keymap.set('v', '<leader>fsc', function()

  local selected_text = vim.getVisualSelection() 

  builtin.grep_string({
    search = selected_text,
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

