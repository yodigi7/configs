lua require('user/config')

" TODO: when able to get version 0.7 update the below to lua file
" https://neovim.io/news/

function! TrimWhiteSpace()
  %s/\s*$//
     ''
endfunction

augroup trimwhitespace
    autocmd!
    autocmd FileWritePre * call TrimWhiteSpace()
    autocmd FileAppendPre * call TrimWhiteSpace()
    autocmd FilterWritePre * call TrimWhiteSpace()
    autocmd BufWritePre * call TrimWhiteSpace()
augroup END

" CoC
" Checks to see if the position behind the current character is a space
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
augroup highlightUsages
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Dispatch
augroup dispatch
    autocmd!
    autocmd FileType java let b:dispatch = 'mvn test'
    autocmd FileType javascript let b:dispatch = 'npm test'
    autocmd FileType python let b:dispatch = 'npm test'
augroup END
