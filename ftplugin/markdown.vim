" Enable spellcheck for markdown files
setlocal spell spelllang=en_us

" display the rendered markdown in your browser
" if executable('grip')
"   nnoremap <buffer><space>m :Dispatch grip --pass $GRIP -b %<cr>
" endif

noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

function! OpenMarkdownPreview() abort
  if exists('s:markdown_job_id')
    call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  let available_port = system(
    \ "lsof -s tcp:listen -i :40500-40800 | awk -F ' *|:' '{ print $10 }' | sort -n | tail -n1"
    \ ) + 1
  if available_port == 1 | let available_port = 40500 | endif
  let job_id = jobstart('grip ' . shellescape(expand('%:p')) . ' :' . available_port)
  if job_id <= 0 | return | endif
  let s:markdown_job_id = job_id
  silent exec '!open http://localhost:' . available_port
endfunction
