" color scheme
Bundle 'peaksea'
Bundle 'freya'

" Bundles no need to operate or config
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
" 5. File Search Open by C-P.
"    c-f, c-b: switch mode
"    c-r: use regex mode
"    c-t, c-v, c-x: open in new tab or split
"    c-y: create new file
"    c-z: to (un)?mark multiple file to c-o
Bundle 'kien/ctrlp.vim'
"
" 6. Graphicsed undo tree
"    bind with <F2>
Bundle 'sjl/gundo.vim'
"
" 7. session manager, misc is required by vim-session
"    Normal operation: :(Save|Open|Close|Delete|View)Session
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
"
" 8. Tagbar
"    bind with <S-F3>
Bundle 'majutsushi/tagbar'
"
" 9. editorconfig, customize different configs like tab,
"    charset for differet type of files
"    the config file is at /vimfiles/editorconfig/.editorconfig
Bundle 'editorconfig/editorconfig-vim'
"
" 10. YouCompleteMe
"     most powerful complete plugin, finally, it can be under windows:
"     http://stackoverflow.com/questions/18693526/vim-completion-with-youcompleteme-on-windows
"     use the verion uplink, not the updated version
"Bundle 'Valloric/YouCompleteMe'
Bundle 'xleng/YCM_WIN_X86'

Bundle 'Engspchk'
Bundle 'FencView.vim'

Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
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

"Bundle 'ack.vim'
" git plugin
"Bundle 'fugitive.vim'

" code complete
Bundle 'AutoClose'
Bundle 'OmniCppComplete'

" enchance status line, it's pure vim (compared with powerline of python)
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'

if !has('win32')
	Bundle 'powerline'
endif

" vim calculator
Bundle 'HowMuch'
