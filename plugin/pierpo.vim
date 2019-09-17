function PPGrepNodeModules()
  call feedkeys("\:grep! -uu -g 'node_modules/**' -F \"\"\<LEFT>")
endfunction
command PPGrepNodeModules call PPGrepNodeModules()

function PPFzfNodeModules()
  call feedkeys("\:Files node_modules\<CR>")
endfunction
command PPFzfNodeModules call PPFzfNodeModules()

function PPConflicts()
  :cexpr system('git lconflicts') | copen
endfunction
command PPConflicts call PPConflicts()

function PPWatchTests()
  execute 'vs term://yarn jest --watch '.expand('%:r')
endfunction
command PPWatchTests call PPWatchTests()

" Creates missing directories (useful when used with ,gF)
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W call WriteCreatingDirs()

function PPOpenTest()
  let l:testname = expand('%:r') . '.test.' . expand('%:e')
  execute ':e ' . l:testname
endfunction
command PPOpenTest call PPOpenTest()
nnoremap <Leader>test :PPOpenTest<CR>

function PPOpenTestSplit()
  let l:testname = expand('%:r') . '.test.' . expand('%:e')
  execute ':vs ' . l:testname
endfunction
command PPOpenTestSplit call PPOpenTestSplit()
nnoremap <Leader>vtest :PPOpenTestSplit<CR>
