" Maintainer:  Sean Catchpole (sean@sunsean.com)
" Last Change: Semptember 4th, 2007
" Comments: Based on Twilight 

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sean2"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   ctermbg=233
  hi CursorColumn ctermbg=236
  hi MatchParen   ctermfg=202 ctermbg=NONE cterm=bold
  hi Pmenu        ctermfg=253 ctermbg=234
  hi PmenuSel     ctermfg=16  ctermbg=113
endif

" General colors
hi Cursor       ctermfg=NONE ctermbg=246  cterm=none
hi Normal       ctermfg=231  ctermbg=232  cterm=none
hi NonText      ctermfg=238  ctermbg=232  cterm=none
hi LineNr       ctermfg=239  ctermbg=16   cterm=none
hi StatusLine   ctermfg=231  ctermbg=234  cterm=bold
hi StatusLineNC ctermfg=243  ctermbg=234  cterm=none
hi TabLine      ctermfg=243  ctermbg=234  cterm=bold
hi TabLineFill  ctermfg=243  ctermbg=234  cterm=bold
hi TabLineSel   ctermfg=231  ctermbg=236  cterm=bold
hi VertSplit    ctermfg=234  ctermbg=234  cterm=none
hi Folded       ctermbg=233  ctermfg=251  cterm=none
hi Title        ctermfg=230  ctermbg=NONE cterm=bold
hi Visual       ctermfg=231  ctermbg=236  cterm=none
hi SpecialKey   ctermfg=244  ctermbg=236  cterm=none

" Syntax highlighting
hi Comment      ctermfg=245
hi Todo         ctermfg=247  ctermbg=NONE cterm=bold
hi Constant     ctermfg=210  cterm=none
hi String       ctermfg=113  cterm=none
hi Identifier   ctermfg=228  cterm=none
hi Function     ctermfg=228  cterm=none
hi Type         ctermfg=228  cterm=none
hi Statement    ctermfg=111  cterm=none
hi Keyword      ctermfg=81   cterm=none
hi PreProc      ctermfg=210  cterm=none
hi Number       ctermfg=203  cterm=none
hi Special      ctermfg=225  cterm=none
