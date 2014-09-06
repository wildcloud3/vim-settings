" vim:fdm=marker

" taglist option {{{
let g:Tlist_Ctags_Cmd=$VIM.'\settings\vimfiles\ctags.exe'
" tags folder
set tags+=$VIM/settings/vimfiles/tags/cpp
" set other for trinity
" open and close tri all
nmap <C-S-F9> :TrinityToggleAll<cr>

function! UpdateTags()
silent execute '!' . g:Tlist_Ctags_Cmd . ' -R --fields=+ianS --extra=+q'
endfunction

nmap <F12> :call UpdateTags()<cr>
" }}}

" DoxygenToolkit option {{{
nmap <leader>dd : Dox<cr>
" if using //// type, uncomment this
"let g:DoxygenToolkit_commentType="C++"
let g:DoxygenToolkit_authorName="Claud.LI"
"let g:DoxygenToolkit_licenseTag="Personal Licence\<center>"
"let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
"let g:DoxygenToolkit_blockHeader="//////////////////////////////////////////////////////////////////////////////////////"
"let g:DoxygenToolkit_blockFooter="/////////////////////////////////////////////////////////////////////////////////////"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_enumName="yes"
let g:DoxygenToolkit_briefTag_structName="yes"
let g:DoxygenToolkit_classTag="yes"
let g:DoxygenToolkit_maxFunctionProtoLines=30
" }}}

" mapping alt-o for a.vim {{{
map <A-o> :A<CR>
" }}}

"To automatically save and restore views for *.c files {{{
au BufWinLeave *.c mkview
au BufWinEnter *.c silent loadview
" }}}

