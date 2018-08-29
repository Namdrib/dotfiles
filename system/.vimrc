" as I get more comfortable, maybe experiment more with https://github.com/amix/vimrc
" vim settings


"""""
" => General
"""""


"""""
" => VIM UI
"""""
" Always show current position
set ruler

" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 

" Add a bit extra margin to the left
set foldcolumn=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""
" => Colours and Fonts
"""""
syntax enable
set background=dark

" Use Unix default file type
set ffs=unix,dos,mac

"""""
" => Files, backups and undo
"""""

" Use spaces instead of tabs
" set expandtab

set smarttab

set ai " auto indent
set si " smart indent

" 1 tab == n spaces
set shiftwidth=4
set tabstop=4

set nu

