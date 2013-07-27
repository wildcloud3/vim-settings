
let mapleader = ','
let g:mapleader = ','

" treat long line as break lines
map j gj
map k gk

" map <SPACE> to pageup and pagedown
map <space> <c-f>
map <c-space> <c-b>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line, if no plugin powerup
" always show statusline
set laststatus=2
" format
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hide tool bar
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b

" launch maximize window 
if has('gui_running')
	if has('win32')
		autocmd GUIEnter * simalt ~x
	endif 
endif 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set working dir as current file's dir
set bsdir=buffer
"set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set encoding
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
let &termencoding=&encoding
set ambiwidth=double
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable temp files
set nobackup
set noswapfile
set history=1024
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search options: ignore case
set ignorecase
set smartcase
set incsearch
set hlsearch
set noerrorbells
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set >> and <<, move 4 spaces
set shiftwidth=4
set smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
" ignore compiled files
set wildignore=*.o,*~

" always show line number
set number
set ruler
set cursorline

"don's redraw when running macros
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto indents
"set noautoindent
set cindent
setlocal cinoptions=g0
set smartindent
set showmatch

set shiftwidth=4
set tabstop=4

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" set 10 lines after cursorline
set so=10
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" share the clipboard with windows
if has('win32')
	set clipboard+=unnamed
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startup option
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
syntax on
set background=dark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

