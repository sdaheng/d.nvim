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

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'danymat/neogen'
Plug 'kdheepak/lazygit.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'navarasu/onedark.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'folke/tokyonight.nvim'

call plug#end()

lua require("treesitter-configs")
lua require("coc-configs")
lua require("term-configs")
lua require("neogen-configs")
lua require("nvim-tree-configs")
lua require("fzf-configs")

" colorscheme dracula
colorscheme tokyonight-night 

:tnoremap <Esc> <C-\><C-n>

let g:NERDTreeWinPos = "left"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd FileType cpp,hpp,h,c setlocal commentstring=//\ %s

