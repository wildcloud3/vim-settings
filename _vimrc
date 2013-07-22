set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader = ','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hide tool bar
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b

" maximize window 
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
" set language
"set langmenu=zh_CN.UTF-8
"language message.zh_CN.UTF-8
" 测试中文
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set guifont=Source_Code_Pro:h10:cANSI
"set guifont=Courier_New:h10:cANSI
set guifontwide=YouYuan:h12

set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable temp files
set nobackup
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
set history=1024
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show line number
set number
set ruler
set cursorline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto indents
"set noautoindent
set cindent
setlocal cinoptions=g0
set smartindent
set showmatch

set shiftwidth=4
set tabstop=4

set backspace=indent,eol,start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startup option
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set IME
if has('multi_byte_ime')
    " color for IME not opened
    hi Cursor guifg=bg guibg=Orange gui=NONE
    " color for IME opened
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    " close auto switch IME function of VIM, in insert and visual mode
    set iminsert=0 imsearch=0
    " remember the insert mode IME statue
    "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" share the clipboard with windows
set clipboard+=unnamed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" reload after edit _vimrc
autocmd! bufwritepost _vimrc source $HOME/_vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vundle, or said plugin manager
" more info, pls refer: http://vim-scripts.org/vim/scripts.html

filetype off

" set vundle path
set rtp+=$HOME/vimfiles/bundle/vundle/
call vundle#rc('$HOME/vimfiles/bundle/')

" vundle core
Bundle 'gmarik/vundle'

" genetic pulgins
Bundle 'Engspchk'

" colorscheme plugin && colorscheme
Bundle 'freya'

" file managment
Bundle 'The-NERD-tree'

" code complete
Bundle 'Shougo/neocomplcache'
Bundle 'SuperTab'

Bundle 'Lokaltog/vim-easymotion'

"active plugin and filetype relationship
filetype plugin indent on	" required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplCache options
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
" set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"inoremap <expr><space> pumvisible() ? neocomplcache#close_popup().'<SPACE>' : '<SPACE>'

" define keyword
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior
let g:neocomplcache_enable_auto_select = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree options
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowLineNumber=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
" !t : open nerd tree
map <silent> <A-t> <ESC>:NERDTreeToggle<CR>
" set opened nerdtree dir as working dir
let NERDTreeChDirMode=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other
autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
" put after bundle setting, otherwise freya would not be found
colorscheme freya
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

