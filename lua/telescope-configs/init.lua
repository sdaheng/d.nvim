require'telescope'.setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
  pickers = {
    buffers = {
      path_display = function(_, path)
        local tail = vim.fn.fnamemodify(path, ":t")
        local parent = vim.fn.fnamemodify(path, ":h:t")
        return string.format("%s (%s)", tail, parent)
      end,
    },
  },
})

require('telescope').load_extension('fzf')

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

vim.keymap.set('n', '<leader>fsh', builtin.search_history, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})

vim.keymap.set('v', '<leader>fs', function()

  local selected_text = vim.getVisualSelection() 

  builtin.grep_string({
    search = selected_text
  })
end)


vim.keymap.set('n', '<leader>fsc', function()
  builtin.grep_string({
    additional_args = function()
      return { '-t', 'cpp', '-t', 'c', '-g', '!TOOLS/', '-g', '!bsw1/', '-g', '!rte1' }
    end
  })
end)

vim.keymap.set('v', '<leader>fsc', function()

  local selected_text = vim.getVisualSelection() 

  builtin.grep_string({
    search = selected_text,
    additional_args = function()
      return { '-t', 'c', '-t', 'cpp', '-g', '!TOOLS/', '-g', '!bsw1/', '-g', '!rte1' }
    end
  })
end)

vim.keymap.set('n', '<leader>fgc', function()
  builtin.live_grep({
    additional_args = function()
      return { '-t', 'c', '-t', 'cpp', '-g', '!TOOLS/', '-g', '!bsw1/', '-g', '!rte1' }
    end
  })
end)

vim.keymap.set('n', '<leader>o', require('telescope.builtin').buffers, { desc = "查找并切换缓冲区" })

