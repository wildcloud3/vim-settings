" vim:fdm=marker

" taglist option {{{
map <F3> :silent! Tlist<CR>
let g:Tlist_Ctags_Cmd=$VIM.'\settings\vimfiles\ctags.exe'
" tags folder
set tags+=$VIM/settings/vimfiles/tags/cpp

" set other for trinity
" open and close tri all
nmap <C-S-F9> :TrinityToggleAll<cr>
" open and close taglist all
nmap <F10> :TrinityToggleTagList<cr>
" open and close nerdtree all
nmap <F11> :TrinityToggleNERDTree<cr>

function! UpdateTags()
silent execute '!' . g:Tlist_Ctags_Cmd . ' -R --fields=+ianS --extra=+q'
endfunction

nmap <F12> :call UpdateTags()<cr>
" }}}

" OmniCppComplete options {{{
" build tags for your own project with ^F12
map <C-F12> :execute '!' . g:Tlist_Ctags_Cmd . ' -R --c++-kinds=+p --fields=+iaS --extra=+q' <CR>
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
"et g:DoxygenToolkit_blockFooter="/////////////////////////////////////////////////////////////////////////////////////"
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

