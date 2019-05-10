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
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" set termguicolors
set list
set listchars=tab:>-


set runtimepath+=/home/robin/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/home/robin/.config/nvim/dein')

call dein#add('Shougo/dein.vim')
call dein#add('arakashic/chromatica.nvim')
call dein#add('morhetz/gruvbox')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('rust-lang/rust.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-jedi')
call dein#add('sebastianmarkow/deoplete-rust')
call dein#add('metakirby5/codi.vim')
call dein#add('ElmCast/elm-vim')
call dein#add('kien/rainbow_parentheses.vim')

call dein#end()

let g:gruvbox_contrast_dark = 'medium'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
