"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run python
" in fact, any thing run-script style could be assembled here

nmap <leader>py :!python %<cr>

function! Run()
	let type = b:current_syntax
	if type == "python"
		exec "!python %"
	endif
endfunction

nmap <F5> :call Run()<cr>

let python_highlight_all = 1

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
