set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader = ','
let g:mapleader = ','

" treat long line as break lines
map j gj
map k gk

" map <SPACE> to / search and <c-space> to ? backward search
map <space> /
map <c-space> ?

" auto save on lost focus
autocmd FocusLost * :wa

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
set wildmenu
" ignore compiled files
set wildignore=*.o,*~

set number
set ruler
set cursorline

"don's redraw when running macros
set lazyredraw
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

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" set 7 lines after cursorline
set so=10
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

Bundle 'Engspchk'

" colorscheme plugin && colorscheme
Bundle 'peaksea'

" Git intergration
Bundle 'fugitive.vim'

" basic useful scripts
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'YankRing.vim'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'ack.vim'

" code complete
Bundle 'Shougo/neocomplcache'
Bundle 'SuperTab'

" need to change src to support ch,
" pls ref: https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

" setting marks
Bundle 'mikeage/ShowMarks'
" different color for tags
Bundle 'Mark'

Bundle 'Lokaltog/vim-easymotion'

Bundle 'ShowTrailingWhitespace' 

" enchance status line
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'

"active plugin and filetype relationship
filetype plugin indent on	" required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
syntax on
set background=dark

" for peaksea
if !has("gui_running")
	set t_Co=256
endif
colorscheme peaksea
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplCache options
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" define keyword
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior
let g:neocomplcache_enable_auto_select = 1

" other
autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
	autocmd FileType *
		\ if &omnifunc == "" |
		\     setlocal omnifunc=syntaxcomplete#Complete |
		\ endif
endif

" set dict files
autocmd FileType js :set dictionary+=$HOME/vimfiles/dict/javascript.dict
autocmd FileType php :set dictionary+=$HOME/vimfiles/dict/php.dict
autocmd FileType c,h :set dictionary+=$HOME/vimfiles/dict/c.dict
autocmd FileType cpp,h,hpp :set dictionary+=$HOME/vimfiles/dict/cpp.dict
autocmd FileType vim :set dictionary+=$HOME/vimfiles/dict/vim.dict
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bufexplorer options
let g:bufExplorerSortBy = 'name'
nmap <silent> <Leader>be :BufExplorer<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic options
let g:syntastic_enable_highlighting = 1
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
" showmarks options
let g:showmarks_enable      = 0
let g:showmarks_include     = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type = 'hqm'
" m{mark} setmark; '{mark} jump to mark
" <leader>mt - toggle showmark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options for different color tags
nmap <silent> <Leader>hl <plug>MarkSet
vmap <silent> <Leader>hl <plug>MarkSet
nmap <silent> <Leader>hh <plug>MarkClear
vmap <silent> <Leader>hh <plug>MarkClear
nmap <silent> <Leader>hr <plug>MarkRegex
vmap <silent> <Leader>hr <plug>MarkRegex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim markdown options
let g:vim_markdown_folding_disabled = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mm for regulize lines, trim()
nmap mm :%s/\r//g<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

