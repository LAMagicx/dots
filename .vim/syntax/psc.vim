" Vim syntax file
" Language:     pseudocode
" Maintainer:   Magic Grice
" Last Change:  2021 Sep 20


" pseudocode keywords
syn keyword     pseudoStatement     retourner de a que
syn keyword     pseudoSwitch        Selon Cas FinSelon
syn keyword     pseudoConditional   Si Alors Sinon FinSi
syn keyword     pseudoLoop          Pour Tant que Faire FinPour FinTantQue

syn keyword     pseudoType          Entier Reel Boolean Caractere Chaine
syn keyword     pseudoIncludes      Debut Fin
syn keyword     pseudoSpecial       Variables Fonction Procedure 

syn keyword     pseudoProgram       Programme 
syn keyword     pseudoBoolean       VRAI FAUX
syn keyword     pseudoFunction      ECRIRE LIRE

syn region      pseudoBlock         start="^\s*Debut" end="^\s*Fin" fold transparent
syn match       pseudoComment       "\\\\.*$"
syn region      pseudoString        start='"' end='"'
syn match       pseudoCharacter     "L\='[^\\]'"
syn match       pseudoNumber        "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn keyword     pseudoOperations    = + < > <= >= := <- % mod pow div *


hi def link pseudoStatement         Statement
hi def link pseudoConditional       Conditional
hi def link pseudoLoop              Repeat
hi def link pseudoSwitch            Conditional
hi def link pseudoType              Type   
hi def link pseudoIncludes          Include 
hi def link pseudoFunction          Function
hi def link pseudoBoolean           Constant
hi def link pseudoProgram           Todo
hi def link pseudoComment           Comment
hi def link pseudoString            String
hi def link pseudoCharacter         Character
hi def link pseudoSpecial           StorageClass
hi def link pseudoOperations        Operator
hi def link pseudoNumber            Number




let b:current_syntax = "psc"
" vim: ts=8
hi def link pseudoSpecial           StorageClass
