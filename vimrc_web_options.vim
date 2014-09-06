" vim:fdm=marker

" for js only {{{
au BufRead,BufNewFile *.js set complete+=k
" }}}

" jsl for js check {{{
autocmd FileType javascript set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ $HOME\vimfiles\jsl\jsl.default.conf\ -process\ %
autocmd FileType javascript set errorformat=%f(%l):\ %m
autocmd FileType javascript inoremap <silent> <F5> <C-o>:make<cr>
autocmd FileType javascript map <silent> <F5> :make<CR>
" }}}
" 
" for jquery syntax {{{
au BufRead,BufNewFile jquery*.js set ft=javascript syntax=jquery
" }}}
