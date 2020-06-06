if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

nnoremap <buffer> <localleader>r 
  \ :write<cr>:call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b 
  \ :write<cr>:call PotionShowBytecode()<cr>

function! PotionCompileAndRunFile()
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
  " Get the bytecode.
  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

  " Check if a syntax error occurred and return
  if match(bytecode, '\vSyntax error') != -1
    echom bytecode
    return
  endif

  let potion_bytecode_buffer = bufwinnr("__Potion_Bytecode__")

  if potion_bytecode_buffer == -1
    " Open a new split and set it up.
    vsplit __Potion_Bytecode__
    setlocal filetype=potionbytecode
    setlocal buftype=nofile
  else
    " Move to existing buffer
    execute potion_bytecode_buffer . "wincmd w"
  endif
  normal! ggdG

  " Insert the bytecode.
  call append(0, split(bytecode, '\v\n'))

endfunction
