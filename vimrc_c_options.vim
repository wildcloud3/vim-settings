"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist option
map <F3> :silent! Tlist<CR>
let Tlist_Ctags_Cmd=$HOME.'\vimfiles\ctags.exe'
" tags folder
set tags+=$HOME/vimfiles/tags/cpp

" set other for trinity
" open and close tri all
nmap <F9> :TrinityToggleAll<cr>
" open and close taglist all
nmap <F10> :TrinityToggleTagList<cr>
" open and close nerdtree all
nmap <F11> :TrinityToggleNERDTree<cr>

function! UpdateTags()
silent execute '!' . Tlist_Ctags_Cmd . ' -R --fields=+ianS --extra=+q'
endfunction

nmap <F12> :call UpdateTags()<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete options
" build tags for your own project with ^F12
map <C-F12> :execute '!' . Tlist_Ctags_Cmd . ' -R --c++-kinds=+p --fields=+iaS --extra=+q' <CR>
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DoxygenToolkit option
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="zhuliang.li"
let g:DoxygenToolkit_licenseTag="Personal Licence\<center>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre="@brief\t"
let g:DoxygenToolkit_paramTag_pre="@param\t"
let g:DoxygenToolkit_returnTag="@return\t"
let g:DoxygenToolkit_briefTag_funcName="no"
let g:DoxygenToolkit_maxFunctionProtoLines=30
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

