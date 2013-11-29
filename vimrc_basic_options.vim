"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme, for peaksea
if !has("gui_running")
	set t_Co=256
endif
colorscheme peaksea
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplCache options
"if !has('python')
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
"endif

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
" howmuch options
" The scale of the result
let g:HowMuch_scale = 2
" the engine order for auto-calculation
let g:HowMuch_auto_engines = ['bc', 'vim', 'py']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
