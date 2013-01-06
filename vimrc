" Jason Wells .vimrc
" http://flipstock.net

" no vi compatibility
set nocompatible

" Windows specific settings
if has("win32")
	" Default Windows behaviors
	source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let eq = ''
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				let cmd = '""' . $VIMRUNTIME . '\diff"'
				let eq = '"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction	

	" Don't use *.ext~ files on Windows
	set nowritebackup
	
	" Vim Windows swap directory
	set directory=$HOMEPATH/vimfiles/swap
else
	" Vim unix swap directory
	set directory=~/.vim/swap
endif

" Load Pathogen
call pathogen#infect()

" Line numbers
set number

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
endif

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nohlsearch		" we don't want to see highlights at first

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
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
