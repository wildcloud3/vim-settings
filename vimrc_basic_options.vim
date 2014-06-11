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

let g:ycm_filetype_blacklist={'unite': 1}

function! UltiSnipsCallUnite()
    Unite -start-insert -immediately -no-empty ultisnips
endfunction

nnoremap <silent> <leader>sn :call UltiSnipsCallUnite()<CR>
inoremap <silent> <S-F11> <ESC>:call UltiSnipsCallUnite()<CR>
"let g:UltiSnipsExpandTrigger="<c-s>"
" }}}

" yankring {{{
nmap <silent> <Leader>yr :YRShow<cr>
let g:yankring_replace_n_pkey = ''
" }}}

" syntastic options {{{
let g:syntastic_enable_highlighting = 1
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
nnoremap <leader>u :<C-u>Unite<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <c-p> :<C-u>Unite -start-insert file_rec/async<CR>

" replace vinegar with unite
nmap - :<C-u>Unite file<CR>

" replace bufexplorer with unite
nmap <silent> <Leader>be :Unite -quick-match buffer<CR>

" replace ack or grep(content search) using unite
nmap <silent> <Leader>ss :<C-u>Unite grep:.<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>
" }}}
" 
" unite.vim {{{
let g:vimfiler_as_default_explorer = 1
" !t : open vimifiler explorer
nnoremap <silent> <A-t> <ESC>:VimFilerExplorer<CR>
"nmap - :VimFiler<CR>
" }}}
" 
