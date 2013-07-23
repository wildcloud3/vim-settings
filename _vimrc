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

" colorscheme plugin && colorscheme
Bundle 'peaksea'

" Git intergration
Bundle 'fugitive.vim'

" Fuzzy file finder
Bundle 'ctrlp.vim'
Bundle 'Syntastic'

" trinity to make a sourceInsight view
Bundle 'SrcExpl'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'Trinity'

Bundle 'bufexplorer.zip'

" auto complete for C/C++
Bundle 'OmniCppComplete'

" comment plugin
Bundle 'The-NERD-Commenter'

" generate documents from comments, and fast gen standard function comment
Bundle 'DoxygenToolkit.vim'

" switch between .cpp and .h
Bundle 'a.vim'
Bundle 'c.vim'

" file managment

" code complete
Bundle 'Shougo/neocomplcache'
Bundle 'SuperTab'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

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
syntax enable
set background=dark

" for peaksea
if !has("gui_running")
	set t_Co=256
endif
colorscheme peaksea
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist option
map <F3> :silent! Tlist<CR>
let Tlist_Ctags_Cmd=$HOME.'\vimfiles\ctags.exe'
" tags folder
set tags+=$HOME/vimfiles/tags/cpp

" set other for trinity
" open and close tri all
nmap <F9> :TrinityToggleAll<cr>
" open and close taglist all
nmap <F10> :TrinityToggleTagList<cr>
" open and close nerdtree all
nmap <F11> :TrinityToggleNERDTree<cr>

function! UpdateTags()
	silent execute '!' . Tlist_Ctags_Cmd . ' -R --fields=+ianS --extra=+q'
endfunction

nmap <F12> :call UpdateTags()<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete options
" build tags for your own project with ^F12
map <C-F12> :execute '!' . Tlist_Ctags_Cmd . ' -R --c++-kinds=+p --fields=+iaS --extra=+q' <CR>
map <C-S-F12> <slient> <C-F12>
let OmniCpp_NamespaceSearch = 1

let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
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
" DoxygenToolkit option
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="zhuliang.li"
let g:DoxygenToolkit_licenseTag="Personal Licence\<center>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre="@brief\t"
let g:DoxygenToolkit_paramTag_pre="@param\t"
let g:DoxygenToolkit_returnTag="@return\t"
let g:DoxygenToolkit_briefTag_funcName="no"
let g:DoxygenToolkit_maxFunctionProtoLines=30
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
" Oooops, only work for python vim
" powerline options
if has('python')
	let g:Powerline_symbols = 'fancy'
	nmap <leader>r :PowerlineReloadColorScheme<CR>
	let g:Powerline_mode_n  = 'N'
	let g:Powerline_mode_i  = 'I'
	let g:Powerline_mode_R  = 'R'
	let g:Powerline_mode_v  = 'v'
	let g:Powerline_mode_V  = 'V'
	let g:Powerline_mode_cv = 'cv'
	let g:Powerline_mode_s  = 's'
	let g:Powerline_mode_S  = 'S'
	let g:Powerline_mode_cs = 'cs'
else
" statline options
	let g:statline_fugitive = 1
	let g:statline_rvm = 1
let g:statline_rbenv = 1
	let g:statline_show_charcode = 1
endif
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
" move cursor in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" self defined filetype relationship
"au BufNewFile,BufRead *.less set filetype=css
"au BufNewFile,BufRead *.phtml set filetype=php
"au BufNewFile,BufRead *.js set ft=javascript.jquery
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mm for regulize lines, trim()
nmap mm :%s/\r//g<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ff for complete fore-back
vmap ff "zdi<?=$this->_('<C-R>z');?><ESC>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

