if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>

function! PotionCompileAndRunFile()
  s:SaveCurrentBuffer()
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
  s:SaveCurrentBuffer()

  " Get the bytecode.
  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

  " Open a new split and set it up.
  vsplit __Potion_Bytecode__
  normal! ggdG
  setlocal filetype=potionbytecode
  setlocal buftype=nofile

  " Insert the bytecode.
  call append(0, split(bytecode, '\v\n'))

endfunction

function! s:SaveCurrentBuffer()
  execute 'normal! :w<cr>'
endfunction
