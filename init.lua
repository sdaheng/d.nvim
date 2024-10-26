-- Set up runtime paths similar to Vim
vim.cmd([[
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
]]) 

require('lazy-configs')

vim.cmd('colorscheme tokyonight-night')

-- Terminal mode escape mapping
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Autocommand to set comment style for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp,hpp,h,c",
  command = "setlocal commentstring=//\\ %s"
})

