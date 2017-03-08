set nocompatible
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set encoding=utf-8
set laststatus=2
set background=dark
filetype plugin indent on

set timeoutlen=1000 ttimeoutlen=0

call plug#begin('~/.vim/plugged')
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'vim-airline/vim-airline'
    Plug 'jeaye/color_coded'
    Plug 'morhetz/gruvbox'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'jceb/vim-orgmode' | Plug 'tpope/vim-speeddating' | Plug 'vim-scripts/utl.vim' | Plug 'tpope/vim-repeat' | Plug 'vim-scripts/taglist.vim' | Plug 'majutsushi/tagbar' | Plug 'chrisbra/NrrwRgn' | Plug 'mattn/calendar-vim' | Plug 'vim-scripts/SyntaxRange'
    Plug 'valloric/youcompleteme'
    Plug 'jalcine/cmake.vim'
    Plug 'edkolev/tmuxline.vim'
    Plug 'edkolev/promptline.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'amix/vim-zenroom'
call plug#end()

let mapleader="ö"
map öö :%pyf /usr/share/clang/clang-format.py<cr>

autocmd VimResized * wincmd =

colo gruvbox

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tmuxline#enabled = 0
let g:promptline_theme = 'airline'
let g:ycm_autoclose_preview_window_after_completion=1
":au BufAdd,BufNewFile,BufRead * nested tab sball

let g:tmux_navigator_no_mappings = 1

execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-h>=\eh"
execute "set <M-l>=\el"
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
