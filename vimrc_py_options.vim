" vim:fdm=marker

" python syntax {{{
let python_highlight_all = 1
" }}}

" compile python depend on the script type {{{
function! Compile()
	let type = b:current_syntax
	if type == "python"
        "let l:compile_script = substitute(bufname('%'), '.py', '.exe.py', 'g')
		exec "!python % py2exe"
    elseif type == "less"
        let l:output_script = substitute(bufname('%'), '.less', '.css', 'g')
		exec "!lessc % > " . l:output_script
	endif
endfunction

nmap <F7> :call Compile()<cr>
" }}}

" gf function for python {{{
" on this has('python') would also match 32 or 64
" this should be for load python lib fail
if has('python')
python << EOF
import os
import sys
import vim
for p in sys.path:
	if os.path.isdir(p):
		vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif
" }}}
