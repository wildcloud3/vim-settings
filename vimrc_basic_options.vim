" vim:fdm=marker

" color scheme, for peaksea {{{
if !has("gui_running")
	set t_Co=256
endif
colorscheme peaksea
" }}}

" YouCompleteMe {{{
" configration for ycm
" YouCompleteMe 功能  
" 补全功能在注释中同样有效  
let g:ycm_complete_in_comments=1  
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示  
let g:ycm_confirm_extra_conf=0  
" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1  
" 补全内容不以分割子窗口形式出现，只显示补全列表  
"set completeopt-=preview  
" 从第一个键入字符就开始罗列匹配项  
let g:ycm_min_num_of_chars_for_completion=1  
" 禁止缓存匹配项，每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0  
" 语法关键字补全              
let g:ycm_seed_identifiers_with_syntax=1  
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;  
let g:ycm_key_invoke_completion = '<M-;>'  
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞  
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>  
" allow scan string and comments
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" }}}

" OmniCppComplete options {{{
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" other
autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
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
" }}}

" bufexplorer options {{{
let g:bufExplorerSortBy = 'name'
nmap <silent> <Leader>be :BufExplorer<cr>
" }}}

" yankring {{{
nmap <silent> <Leader>yr :YRShow<cr>
let g:yankring_replace_n_pkey = ''
" }}}

" syntastic options {{{
let g:syntastic_enable_highlighting = 1
" }}}

" nerd tree options {{{
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
" }}}

" showmarks options {{{
let g:showmarks_enable      = 0
let g:showmarks_include     = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type = 'hqm'
" m{mark} setmark; '{mark} jump to mark
" <leader>mt - toggle showmark
" }}}

" options for different color tags {{{
nmap <silent> <Leader>hl <plug>MarkSet
vmap <silent> <Leader>hl <plug>MarkSet
nmap <silent> <Leader>hh <plug>MarkClear
vmap <silent> <Leader>hh <plug>MarkClear
nmap <silent> <Leader>hr <plug>MarkRegex
vmap <silent> <Leader>hr <plug>MarkRegex
" }}}

" howmuch options {{{
" The scale of the result
let g:HowMuch_scale = 2
" the engine order for auto-calculation
let g:HowMuch_auto_engines = ['bc', 'vim', 'py']
" }}}

" gundo F2 mapping {{{
noremap <F2> :GundoToggle<CR>
" }}}

" for vim session {{{
let g:session_autosave = 1
let g:session_autoload = 1
" periodic in minutes
let g:session_autosave_periodic = 5
" }}}

" tagbar {{{
let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = '$VIM/settings/vimfiles/ctags.exe'
noremap <S-F3> :Tagbar<CR>
" }}}
" 
" unite.vim {{{
" mainly for key bindings
nnoremap <C-p> :<C-u>Unite<CR>
" }}}
