
-- Set runtime path to include your .vim directory and the after directory
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim,~/.vim/after'

-- Set packpath to be the same as runtimepath
vim.o.packpath = vim.o.runtimepath

-- Source the Vim configuration file (~/.vimrc)
vim.cmd('source ~/.vimrc')

require('lazy-configs')

-- Terminal mode escape mapping
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Autocommand to set comment style for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp,hpp,h,c",
  command = "setlocal commentstring=//\\ %s"
})

-- vim.wo.relativenumber = true

vim.cmd('colorscheme onedark')
vim.cmd('set number')

