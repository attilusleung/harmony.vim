" Vim syntax file
" Language: Harmony
" Maintainer: Yuet Ming Leung <yl787@cornell.edu>
" Last Change: 2022 April 11

Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='hny'
  let b:current_syntax="hny"
endif

syn keyword importOp import

" TODO Do we even want operators
syn keyword opKey and or mod
" syn match arithOp "(=>|&|\|\^|-|\+|\*|\/\/|\/|%|\*\*|<<|>>)"
" syn match compOp "(==|!=|<|<=|>|>=)"
" syn match unaryOp "(-|~)"
syn keyword opKey not abs atLabel countLabel get_context contexts isEmpty min max len str any all keys hash choose

" TODO: Make this part of match
" syn keyword lambdaEnd end

syn keyword TODO contained TODO FIXME NOTE XXX

syn keyword statementKey as print setintlevel save stop const assert var trap pass del spawn invariant go sequential let exists in hyper_assert
syn keyword importKey import from 

syn keyword repeatKey for while when await
syn keyword conditionalKey if elif else when
syn match conditionalMatch 'when exists'

syn keyword functionKey def nextgroup=functionName skipwhite

syn keyword resultVar result

syn keyword valueKey None atomically eternal
syn keyword boolKey False True

syn match functionName '[a-zA-Z_][a-zA-Z_0-9]*' contained

syn match number '\d\+' display

syn match comment "#.*$" contains=TODO
syn match comment "(\(\*\_.*\*\))" contains=TODO

syn match label "^[ \t]*[a-zA-Z_][a-zA-Z_0-9]*:"

" TODO: Escapes
syn match stringEsc '\\.' display contained
syn match stringEsc '\\\n' display contained
syn region string start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=stringEsc
syn region string start=+"+ skip=+\\\\\|\\'\|\\$+ excludenl end=+"+ end=+$+ keepend contains=stringEsc
syn region string start=+'''+ skip=+\\\\\|\\'\|\\$+ end=+'''+ keepend contains=stringEsc
syn region string start=+"""+ skip=+\\\\\|\\'\|\\$+ end=+"""+ keepend contains=stringEsc


if v:version >= 508 || !exists('did_python_syn_inits')
    if v:version <= 508
        let did_python_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink arithOp         Operator
    HiLink compOp          Operator
    HiLink TODO            Todo
    HiLink comment         Comment
    HiLink opKey           Operator
    HiLink statementKey    Keyword
    HiLink valueKey        Keyword
    HiLink functionKey     Keyword
    HiLink importKey       Include
    HiLink repeatKey       Repeat
    HiLink repeatMatch     Repeat
    HiLink conditionalKey  Conditional
    HiLink functionName    Function
    HiLink resultVar       Identifier
    HiLink boolKey         Boolean
    HiLink string          String
    HiLink stringEsc       Special

    delcommand HiLink
endif

