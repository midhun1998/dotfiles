set nocompatible
" Prevents line from getting commented when pasting multiple lines with comments
"set paste
set tabstop=4
set shiftwidth=4
set number
set textwidth=100
set showmatch
set incsearch
set scrolloff=5
set laststatus=2
set spell spelllang=en_us
set autochdir
set undofile
set encoding=utf-8
set clipboard=unnamedplus

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'elzr/vim-json'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" go to the middle of the line using gm
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>

syntax enable

" Open Vim from the same place you left off at
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
