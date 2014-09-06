" vim:fdm=marker

" remap leader using ',' {{{
let mapleader = ','
let g:mapleader = ','
" }}}

" treat long line as break lines {{{
map j gj
map k gk
" }}}

" map <SPACE> to pageup and pagedown {{{
map <space> <c-f>
map <c-space> <c-b>
" }}}

" status line, if no plugin powerup {{{
" always show statusline
set laststatus=2
" format
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" }}}

" hide tool bar {{{
"set guioptions-=m
"set guioptions-=T
"set guioptions-=L
"set guioptions-=r
"set guioptions-=b
set go=

" launch maximize window
if has('gui_running')
    if has('win32')
        autocmd GUIEnter * simalt ~x
    endif
endif
" }}}

" set working dir as current file's dir {{{
set bsdir=buffer
"set autochdir
" }}}

" set encoding {{{
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
let &termencoding=&encoding
set ambiwidth=double
" }}}

" source menu stuffs {{{
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
" }}}

" disable temp files {{{
set nobackup
set noswapfile
set history=1024
" }}}

" search options: ignore case {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
set noerrorbells
" }}}

" match and line style {{{
set wildmenu
" ignore files and folders
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*.o,*~

" always show line number
set number
set ruler
set cursorline

"don's redraw when running macros
set lazyredraw
" }}}

" setting indents {{{
"set noautoindent
set cindent
setlocal cinoptions=g0
set smartindent
set showmatch

" set >> and <<, move 4 spaces
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

" and some different options based on filetype
au BufRead,BufNewFile *.html,*.htm,*.css,*.js set noexpandtab tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.html,*.htm set ft=html
"autocmd BufNewFile, BufRead *.py set nosmarttab

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" set 10 lines after cursorline
set so=10
" }}}

" share the clipboard with windows {{{
if has('win32')
    set clipboard+=unnamed
endif
" }}}

" startup option {{{
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
" }}}

" persistent undo {{{
set undofile
set undodir=$VIM/\_undodir
set undolevels=1000
" }}}

" color basic option {{{
syntax on
set background=dark
" }}}

" run file depend on the script type {{{
function! Run()
    let type = b:current_syntax
    if type == "python"
        exec "!python -B %"
    elseif type == "dosbatch"
        exec "!%"
    endif
endfunction

nmap <F5> :call Run()<cr>
" }}}

" zeal mapping (not active now) {{{
function! LookupZeal()
    "let type = b:current_syntax
    exec "!zeal.exe --query open"
endfunction

"nnoremap <Leader>z :call LookupZeal()<CR><CR>
" }}}

" some mapping learned from dotvim {{{
" aux functions {{{
function! Preserve(command) "{{{
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    execute a:command
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction "}}}
function! StripTrailingWhitespace() "{{{
    call Preserve("%s/\\s\\+$//e")
endfunction "}}}
"}}}
set backspace=indent,eol,start
nmap <leader>fef :call Preserve("normal gg=G")<CR>
nmap <leader>f$ :call StripTrailingWhitespace()<CR>
vmap <leader>s :sort<CR>
inoremap <C-h> <left>
inoremap <C-l> <right>
" }}}
