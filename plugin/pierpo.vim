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

function PPWatchTestsCRA()
  execute 'vs term://yarn react-scripts test '.expand('%:r')
endfunction
command PPWatchTestsCRA call PPWatchTestsCRA()

function PPWatchTestsAda()
  execute 'vs term://yarn test:unit:ada --watch '.expand('%:t:r')
endfunction
command PPWatchTestsAda call PPWatchTestsAda()

function PPWatchTestsAdaServer()
  execute 'vs term://yarn test:unit --watch '.expand('%:t:r')
endfunction
command PPWatchTestsAdaServer call PPWatchTestsAdaServer()

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

function PPCheckImportAndRequire()
  let l:current_filename = expand('%:t:r')
  execute ':grep! "import.*' . l:current_filename . '\|require.*' . l:current_filename . '"'
endfunction
command PPCheckImportAndRequire call PPCheckImportAndRequire()

function PPCheckRequire()
  let l:current_filename = expand('%:t:r')
  execute ':grep! "require.*' . l:current_filename . '"'
endfunction
command PPCheckRequire call PPCheckRequire()

function PPImport()
  let @a = 'import ' . expand('%:t:r') . ' from ' . '"' . expand('%:r') . '"'
endfunction
command PPImport call PPImport()
