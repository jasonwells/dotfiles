" Jason Wells .vimrc
" http://flipstock.net

" no vi compatibility
set nocompatible

" Vim unix swap directory
set directory=~/.vim/swap

" Load Plugins with https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tomtom/tlib_vim'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'vim-airline/vim-airline'
Plug 'burnettk/vim-angular'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'curist/vim-angular-template'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

" Line numbers
set number

" Show column and line
set ruler

" Syntax highlighting and filetype plugin specific
syntax on
filetype plugin on
filetype indent on

" Always show bookmarks in file browser
let NERDTreeShowBookmarks=1

" gvim specific settings
if has("gui_running")
    set background=dark
    colorscheme solarized

    " different mac vs windows gui preferences
    if has("gui_macvim")
        let macvim_hig_shift_movement = 1 " highlight with shift
        set gfn=Inconsolata:h14
        set lines=999 columns=150
    else
        set gfn=Inconsolata:h11
        set lines=75 columns=115
    endif

    " Better indenting on line breaks
    set breakindent
endif

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nohlsearch      " we don't want to see highlights at first

" Backups
set nobackup

" Wrap long lines at a word break instead of some random character location
set linebreak
set display=lastline

" Encoding
set encoding=utf-8

" No line folding
set nofoldenable

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Switch from an unsaved buffer without saving it first
set hidden

" If unsaved changes, ask if you want to save
set confirm

" ttyfast
set ttyfast

" Filetype specific settings
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" airline
set laststatus=2

" Ctrl-P tags
nnoremap <leader>t :CtrlPTag<CR>
set wildignore+=*/node_modules/*,*/bower_components/*,tmp/*,typings/*

autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

" Extended bracket matching
runtime macros/matchit.vim

let vim_markdown_preview_hotkey='<C-m>'

" Map json pretty print
map <C-j> gqaj

" Auto and smart indenting
set autoindent
set smartindent

" Prettier formatting
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
