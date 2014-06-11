" vim:fdm=marker

" color scheme {{{
Bundle 'peaksea'
Bundle 'freya'
" }}}

" useful Bundles no need to operate or config {{{
"
" 1. repeat.vim, just extend the function of '.' for plugin maps
Bundle 'tpope/vim-repeat'
"
" 2. indexed-search, extends the function of search,
"    list out the 'match/total regex';
"    use g/ or \\ or \/ to list out your current position
Bundle 'henrik/vim-indexed-search'
"
" 3. syntax checker, but based on the tools in $PATH,
"    like pyflakes, pylint, gcc (there's a lot under it's folder)
Bundle 'scrooloose/syntastic'
"
" 4. Persistence yank files, use <leader>yr to show :YRShow
Bundle 'YankRing.vim'
"
" 5. Graphicsed undo tree
"    bind with <F2>
Bundle 'sjl/gundo.vim'
"
" 6. session manager, misc is required by vim-session
"    Normal operation: :(Save|Open|Close|Delete|View)Session
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
"
" 7. Tagbar
"    bind with <S-F3>
Bundle 'majutsushi/tagbar'
"
" 8. editorconfig, customize different configs like tab,
"    charset for differet type of files
"    the config file is at /vimfiles/editorconfig/.editorconfig
Bundle 'editorconfig/editorconfig-vim'
"
" 9. YouCompleteMe
"     most powerful complete plugin, finally, it can be under windows:
"     http://stackoverflow.com/questions/18693526/vim-completion-with-youcompleteme-on-windows
"     use the verion uplink, not the updated version
"Bundle 'Valloric/YouCompleteMe'
Bundle 'xleng/YCM_WIN_X86'
"
" 10. CamelCaseMotion && argtextobj
"     these two plugin aims to extend vim's motion and textobj behaviour,
"     CamelCaseMotion is used to navigate between CamelCaseWords or
"     underscore_notation using '<leader>wbe',
"     argtextobj is used to navigate between arguments of functions, using 'a' for identify
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'bkad/CamelCaseMotion'
"
" 11. vim-polyglot
"	  a package of 50+ language syntax, but still keep fast on loading
Bundle 'sheerun/vim-polyglot'
" 
" 12. unite.vim
"     Something like ctrlp, but more for supply an intergration interface
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
" 
" 13. vimfiler
"     the one may replace nerd tree
Bundle 'Shougo/vimfiler.vim'
" }}}

Bundle 'Engspchk'
Bundle 'FencView.vim'

Bundle 'The-NERD-Commenter'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'ShowTrailingWhitespace'

" setting marks
Bundle 'mikeage/ShowMarks'
" different color for tags
Bundle 'Mark'

" need to change src to support ch,
" pls ref: https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

" ack is for file content search under given dir_rec
"Bundle 'ack.vim'
" git plugin
"Bundle 'fugitive.vim'

" code complete
Bundle 'AutoClose'

" enchance status line, it's pure vim (compared with powerline of python)
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'

if !has('win32')
	Bundle 'powerline'
endif

" vim calculator
Bundle 'HowMuch'
