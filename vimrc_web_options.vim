set nocompatible
source $VIMRUNTIME/mswin.vim

" zhuliang.li, 2013.07.27
" config my personal vim setting here
" temporarily, only basic, c and web model

let g:cfg_option = "basic"
"let g:cfg_option = "c"
"let g:cfg_option = "web"

source $VIM/settings/vimrc_basic.vim

" auto save on lost focus
autocmd FocusLost * silent! wa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set font
" 测试中文
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set guifont=Source_Code_Pro:h10:cANSI
"set guifont=Courier_New:h10:cANSI
set guifontwide=YouYuan:h12
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set IME
if has('multi_byte_ime')
    " color for IME not opened
    hi Cursor guifg=bg guibg=Orange gui=NONE
    " color for IME opened
    hi CursorIM guifg=NONE guibg=Blue gui=NONE
    " close auto switch IME function of VIM, in insert and visual mode
    set iminsert=0 imsearch=0
    " remember the insert mode IME statue
    "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" reload after edit _vimrc
autocmd! bufwritepost _vimrc source $VIM/settings/_vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vundle, or said plugin manager
" more info, pls refer: http://vim-scripts.org/vim/scripts.html

filetype off

" set vundle path
set rtp+=$VIM/settings/vimfiles/bundle/vundle/
call vundle#rc('$VIM/settings/vimfiles/bundle/')

" vundle core
Bundle 'gmarik/vundle'

Bundle 'Engspchk'
Bundle 'peaksea'
Bundle 'FencView.vim'
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'YankRing.vim'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ShowTrailingWhitespace' 

" need to change src to support ch,
" pls ref: https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

" git plugin
Bundle 'fugitive.vim'

" code complete
Bundle 'AutoClose'
if has('python')
	Bundle 'UltiSnips'
	Bundle 'Valloric/YouCompleteMe'
else
	"Bundle 'Shougo/neocomplcache'
	"Bundle 'SuperTab'
endif

" setting marks
Bundle 'mikeage/ShowMarks'
" different color for tags
Bundle 'Mark'

" for web dev {{{
" syntax highlight
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'php.vim-html-enhanced'
Bundle 'pangloss/vim-javascript'

" css color preview, show corresponding color on color HEX
Bundle 'css-color-preview'

"jump between tags, for html
Bundle 'matchit.zip'
Bundle 'MatchTag'

" Zen coding
Bundle 'ZenCoding.vim'
Bundle 'rstacruz/sparkup'

" }}}

" enchance status line
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'

if !has('win32')
	Bundle 'powerline'
endif

"active plugin and filetype relationship
filetype plugin indent on	" required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme, for peaksea
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

" for js only
set complete+=k
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jsl for js check
autocmd FileType javascript set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ $HOME\vimfiles\jsl\jsl.default.conf\ -process\ %
autocmd FileType javascript set errorformat=%f(%l):\ %m
autocmd FileType javascript inoremap <silent> <F5> <C-o>:make<cr>
autocmd FileType javascript map <silent> <F5> :make<CR>
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

