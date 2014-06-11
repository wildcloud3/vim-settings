" vim:fdm=marker

" color scheme {{{
NeoBundle 'peaksea'
NeoBundle 'freya'
" }}}

" useful Bundles no need to operate or config {{{
"
" 1. repeat.vim, just extend the function of '.' for plugin maps
NeoBundle 'tpope/vim-repeat'
"
" 2. indexed-search, extends the function of search,
"    list out the 'match/total regex';
"    use g/ or \\ or \/ to list out your current position
NeoBundle 'henrik/vim-indexed-search'
"
" 3. syntax checker, but based on the tools in $PATH,
"    like pyflakes, pylint, gcc (there's a lot under it's folder)
NeoBundle 'scrooloose/syntastic'
"
" 4. Persistence yank files, use <leader>yr to show :YRShow
NeoBundle 'YankRing.vim'
"
" 5. Graphicsed undo tree
"    bind with <F2>
NeoBundle 'sjl/gundo.vim'
"
" 6. session manager, misc is required by vim-session
"    Normal operation: :(Save|Open|Close|Delete|View)Session
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
"
" 7. Tagbar
"    bind with <S-F3>
NeoBundle 'majutsushi/tagbar'
"
" 8. editorconfig, customize different configs like tab,
"    charset for differet type of files
"    the config file is at /vimfiles/editorconfig/.editorconfig
NeoBundle 'editorconfig/editorconfig-vim'
"
" 9. YouCompleteMe
"     most powerful complete plugin, finally, it can be under windows:
"     http://stackoverflow.com/questions/18693526/vim-completion-with-youcompleteme-on-windows
"     use the verion uplink, not the updated version
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'xleng/YCM_WIN_X86'
"
" 10. CamelCaseMotion && argtextobj
"     these two plugin aims to extend vim's motion and textobj behaviour,
"     CamelCaseMotion is used to navigate between CamelCaseWords or
"     underscore_notation using '<leader>wbe',
"     argtextobj is used to navigate between arguments of functions, using 'a' for identify
NeoBundle 'vim-scripts/argtextobj.vim'
NeoBundle 'bkad/CamelCaseMotion'
"
" 11. vim-polyglot
"	  a package of 50+ language syntax, but still keep fast on loading
NeoBundle 'sheerun/vim-polyglot'
" 
" 12. unite.vim
"     Something like ctrlp, but more for supply an intergration interface
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" 
" 13. vimfiler
"     the one may replace nerd tree
NeoBundle 'Shougo/vimfiler.vim'
"
" 14. vimproc, async executor, maybe replaced by neovim in the future
" in new system, need to be rebuild with n?make
" ref the :h vimproc for detail
NeoBundle 'Shougo/vimproc.vim'
" }}}

NeoBundle 'Engspchk'
NeoBundle 'FencView.vim'

NeoBundle 'The-NERD-Commenter'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ShowTrailingWhitespace'

" setting marks
NeoBundle 'mikeage/ShowMarks'
" different color for tags
NeoBundle 'Mark'

" need to change src to support ch,
" pls ref: https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
NeoBundle 'Tabular'

" ack is for file content search under given dir_rec
"NeoBundle 'ack.vim'
" git plugin
"NeoBundle 'fugitive.vim'

" code complete
NeoBundle 'AutoClose'

" enchance status line, it's pure vim (compared with powerline of python)
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'

if !has('win32')
	NeoBundle 'powerline'
endif

" vim calculator
NeoBundle 'HowMuch'
