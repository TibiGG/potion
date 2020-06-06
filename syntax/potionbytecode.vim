if exists("b:current_syntax")
  finish
endif

syntax keyword potionBytecodeKeyword getupval getlocal mult
syntax keyword potionBytecodeKeyword setupval return loadpn
syntax keyword potionBytecodeKeyword setlocal move loadk
syntax keyword potionBytecodeKeyword msg proto call bind self
syntax keyword potionBytecodeKeyword code assign expr block
syntax keyword potionBytecodeKeyword times value list

syntax keyword potionBytecodeBoolean nil

syntax match potionBytecodeComment "\v\;.*$"

syntax match potionBytecodeType "\v^\.\w+"

highlight link potionBytecodeKeyword Keyword
highlight link potionBytecodeBoolean Boolean
highlight link potionBytecodeComment Comment
highlight link potionBytecodeType Type

let b:current_syntax = "potionBytecode"
