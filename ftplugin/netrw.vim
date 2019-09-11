" Fix orphan buffers of netrw
setlocal bufhidden=delete

function! NetrwMapping()
  nnoremap <buffer> <c-l> :wincmd l<cr>
endfunction
call NetrwMapping()
