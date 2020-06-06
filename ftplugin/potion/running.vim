if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

nnoremap <buffer> <localleader>r 
  \ :write<cr>:call potion#running#PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b 
  \ :write<cr>:call potion#running#PotionShowBytecode()<cr>

