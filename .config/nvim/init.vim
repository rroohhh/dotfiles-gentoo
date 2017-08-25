if &compatible
      set nocompatible
endif

set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set encoding=utf-8
set laststatus=2

set runtimepath+=/home/robin/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/home/robin/.config/nvim/dein')

call dein#add('Shougo/dein.vim')
call dein#add('arakashic/chromatica.nvim')
call dein#add('morhetz/gruvbox')
call dein#add('christoomey/vim-tmux-navigator')

call dein#end()

filetype plugin indent on
syntax enable
set background=dark    " Setting dark mode
colorscheme gruvbox

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

map öö :%pyf /usr/share/clang/clang-format.py<cr>

nnoremap s h
nnoremap n j
nnoremap t k
