local fzf = require('fzf-lua')

fzf.setup({
  "telescope",
  keymap = {
    fzf = {
      ['ctrl-n'] = 'down',
      ['ctrl-p'] = 'up',
      ['ctrl-j'] = 'down',
      ['ctrl-k'] = 'up',
    },
  },
  -- winopts={preview={default="bat"}},
  winopts = {
  --   fullscreen = false,
  --   width = 0.5,
  --   height = 0.92,
  --   row = 0.04,
  --   col = 0.25,
    preview = {
      layout = 'vertical',
      vertical = 'up:50%',
      -- border = 'noborder',
    },
  },
  files = {
    fd_opts = "--color=never --type f --type l --hidden --exclude .git --exclude '*.obj' --exclude '*.o'",
  }
})

local map = vim.keymap.set

-- File finding
map('n', '<leader>ff', fzf.files, { desc = 'Find files' })

-- Search
map('n', '<leader>fg', fzf.live_grep, { desc = 'Live grep' })
map('n', '<leader>fs', fzf.grep_cword, { desc = 'Grep word under cursor' })

-- Visual selection grep
function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})
  text = string.gsub(text, "\n", "")
  return #text > 0 and text or ''
end

map('v', '<leader>fs', function()
  fzf.grep({ search = vim.getVisualSelection() })
end, { desc = 'Grep selected text' })

-- C/C++ scoped search
local c_cpp_rg_opts = "-t c -t cpp -g '!TOOLS/' -g '!bsw1/' -g '!rte1/'"

map('n', '<leader>fgc', function()
  fzf.live_grep({ rg_opts = c_cpp_rg_opts })
end, { desc = 'Live grep (C/C++)' })

map('n', '<leader>fsc', function()
  fzf.grep_cword({ rg_opts = c_cpp_rg_opts })
end, { desc = 'Grep word (C/C++)' })

map('v', '<leader>fsc', function()
  fzf.grep({ search = vim.getVisualSelection(), rg_opts = c_cpp_rg_opts })
end, { desc = 'Grep selected (C/C++)' })

-- Buffers, help, history, resume
map('n', '<leader>fb', fzf.buffers, { desc = 'Find buffers' })
map('n', '<leader>o', fzf.buffers, { desc = 'Buffers' })
map('n', '<leader>fh', fzf.help_tags, { desc = 'Help tags' })
map('n', '<leader>fsh', fzf.search_history, { desc = 'Search history' })
map('n', '<leader>fr', fzf.resume, { desc = 'Resume last search' })
