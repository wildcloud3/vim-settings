" vim:fdm=marker

set nocompatible
"source $VIMRUNTIME/mswin.vim

" zhuliang.li, 2013.07.27
" config my personal vim setting here
" temporarily, only: basic, c, web

" basic corss language setting chooser {{{
"let g:cfg_option = ['basic', 'c', 'py']
let g:cfg_option = ['basic', 'c', 'py', 'web']
" }}}

" basic setting file {{{
source $VIM/settings/vimrc_basic.vim
" }}}

" auto save on lost focus {{{
autocmd FocusLost * silent! wa
" }}}

" font setting {{{
" set font
" 测试中文
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set guifont=Source_Code_Pro:h10:cANSI
"set guifont=Courier_New:h10:cANSI
set guifontwide=YouYuan:h12
" }}}

" set IME {{{
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
" }}}

" reload after edit _vimrc {{{
autocmd! bufwritepost _vimrc source $VIM/settings/_vimrc
" }}}

" set vundle {{{
" more info, pls refer: http://vim-scripts.org/vim/scripts.html

filetype off

" set vundle path
set rtp+=$VIM/settings/vimfiles/bundle/neobundle.vim/
call neobundle#begin('$VIM/settings/vimfiles/bundle/')

" vundle core
"Bundle 'gmarik/vundle'
NeoBundleFetch 'Shougo/neobundle.vim'

for item in g:cfg_option
	let s:vim_script = $VIM . '/settings/vimrc_' . item . '_bundle.vim'
	if filereadable(s:vim_script)
		execute "source " . s:vim_script
	endif
endfor

call neobundle#end()

"active plugin and filetype relationship
filetype plugin indent on	" required!

NeoBundleCheck
" }}}

" load language specify {{{
for item in g:cfg_option
	let s:vim_script = $VIM . '/settings/vimrc_' . item . '_options.vim'
	if filereadable(s:vim_script)
		execute "source " . s:vim_script
	endif
endfor
" }}}

" add no wrap for log-like files {{{
autocmd BufNewFile,BufRead *.log :set nowrap
" }}}
