"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2022 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:NERDTreeWinPos = "left"

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'navarasu/onedark.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danymat/neogen'

call plug#end()

lua require("treesitter-configs")
lua require("coc-configs")
lua require("term-configs")
lua require("neogen-configs")

" colorscheme dracula
colorscheme onedark

:tnoremap <Esc> <C-\><C-n>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd FileType cpp,hpp,h,c setlocal commentstring=//\ %s

