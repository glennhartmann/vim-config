"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" LANGUAGE: 	LOLCODE
""""" AUTHOR:		Théophile BASTIAN (aka Tobast) <tobast@tobast.fr>
""""" LAST CHANGE:	2011 Oct 19
""""" LICENSE:		GNU GPLv3
""""" SYNTAX HIGHLIGHTING FOR VIM!!1

if exists("b:current_syntax")
	finish
endif

""" Defining regions, etc. ---
syn region lolMultiComment start=/OBTW/ end=/TLDR/
syn match lolLineComment 'BTW.*$'
syn keyword LolOperator
	\ SUM DIFF PRODUKT QUOSHUNT MOD BIGGR SMALLR BOTH EITHER WON NOT ALL ANY OF AN SAEM DIFFRINT WTF? OMG OMGWTF HAI KTHXBYE GTFO
syn keyword LolKeyword
	\ I HAS A R ITZ OIC IS NOW A MAEK MEBBE YR PLZ OPEN
syn match LolSpecChar ":)"
syn match LolSpecChar ":>"
syn match LolSpecChar ":\""
syn match LolSpecChar ":o"
syn match LolSpecChar "::"
syn match LolKeyword "O RLY?"
syn match LolKeyword "YA RLY"
syn match LolKeyword "NO WAI"
syn match LolKeyword "FOUND YR"
syn match LolKeyword "HOW DUZ I"
syn match LolKeyword "IF U SAY SO"
syn match LolKeyword "AWSUM THX"
syn match LolKeyword "O NOES"
syn keyword LolType
	\ TROOF YARN NUMBR NUMBAR NOOB
syn keyword LolBool WIN FAIL
syn match LolNum '[+-]\?\d\+'
syn match LolNum '[+-]\?\d\+\.\d*'
syn match LolString '".*"'
syn match LolInclude "CAN HAS [A-Za-z]\+?"
syn match LolRepeat "IM IN YR "
syn match LolRepeat "IM OUTTA YR "
syn keyword LolBaseFunc
	\ VISIBLE INVISIBLE GIMMEH

""" Defining highlighting ---
command -nargs=+ HiLink hi link <args>

HiLink lolMultiComment Comment
HiLink lolLineComment Comment
HiLink LolOperator Operator
HiLink LolKeyword Statement
HiLink LolEscapedChar SpecialChar
HiLink LolBool Boolean
HiLink LolNum Number
HiLink LolString String
HiLink LolInclude Include
HiLink LolRepeat Repeat
HiLink LolBaseFunc Function
HiLink LolSpecChar Special

delcommand HiLink


""" End, etc. ---
let b:current_syntax="lolcode"

"EOF"
