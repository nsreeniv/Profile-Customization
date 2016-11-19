set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE BEGIN -----------------------------------------------
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jaxbot/semantic-highlight.vim'
" Add Plugins *before* this line. 
call vundle#end()            
filetype plugin indent on
" VUNDLE END ------------------------------------------------

" CUSTOM SETTINGS BEGIN -------------------------------------
syntax on
set term=dtterm
set backspace=indent,eol,start "Allow backspacing over autoindent, line breaks, start of insert
set shiftwidth=4               "Auto indent level 
set expandtab                  "Tabs to spaces
set number                     "Show line numbers
set noerrorbells               "Disable error bells
set mouse=a                    "Enable mouse use
set encoding=utf-8             "Character encoding
set laststatus=2               "Display status line always
set statusline=%f              "Statusline of open file: filename
set ignorecase                 "Ignore case for searches
set smartcase                  "^ Unless it has a capital letter - then be case sensitive
set gfn=Droid\ Sans\ Mono\ 12  "Vim font style/size
set background=dark            "For dark color scheme
set splitright                 "New window splits open on the right
set hlsearch
colorscheme flatcolor          "Color scheme available here: https://github.com/MaxSt/FlatColor 
" CUSTOM SETTINGS END --------------------------------------

" CUSTOM MAPPINGS ------------------------------------------ 
" Create vertical split -- Now 'Ctrl + v'
map <C-v> <C-w>v
" Move current window to left -- Now 'F1'
map <F1> <C-w>H
" Move current window to right -- Now 'F2'
map <F2> <C-w>L
" Redo -- Now 'r'
map r <C-R>
" Toggle highlight searching on current word
:noremap <F4> :set hlsearch! hlsearch?<CR>
" CUSTOM MAPPINGS END---------------------------------------

" NERD TREE BEGIN ------------------------------------------
"Map CTRL+N to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>
" Close VIM if nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.o$','\.tsk$','@']
" NERD TREE END --------------------------------------------

" SEMANTIC HIGHLIGHT BEGIN ---------------------------------
:nnoremap <C-h> :SemanticHighlightToggle<CR>
" SEMANTIC HIGHGLIGHT END ----------------------------------

" SYNTASTIC BEGIN ------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_clang_check_config_file = "" 
let g:syntastic_error_symbol = "✗"
let g:syntastic_cpp_compiler = 'cppcheck'
" SYNTASTIC END -------------------------------------------

" PATHOGEN RUN FOR PLUGINS --------------------------------
filetype on
au BufNewFile,BufRead *.gob set filetype=c
call pathogen#infect()
call pathogen#helptags() " Load the help tags for all plugins
syntax on
" ---------------------------------------------------------
