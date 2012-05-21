" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Pacaud Aurélien
" Last Change:	2008 Dec 12

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "aureal"

highlight Comment     ctermfg=8  guifg=#00aa00
highlight Constant    ctermfg=14 cterm=none    guifg=#ffa0a0 gui=none
highlight Identifier  ctermfg=6  guifg=#00c0c0
highlight Statement   ctermfg=3  cterm=none    guifg=#de2aff gui=none
highlight PreProc     ctermfg=10 guifg=#00ff00
highlight Type        ctermfg=2	 guifg=#00c000
highlight Special     ctermfg=12 guifg=#0000ff
highlight Error       ctermbg=9	 guibg=#ff0000
highlight Todo        ctermfg=4  ctermbg=3     guifg=#000080 guibg=#c0c000
highlight Directory   ctermfg=2  guifg=#00c000
highlight StatusLine  ctermfg=11 ctermbg=12 cterm=none guifg=#000000 guibg=#808080 gui=none
highlight Normal                 guifg=#ffffff guibg=#000000
highlight Search      ctermbg=3	 guibg=#c0c000
highlight ColorColumn ctermbg=6

hi LineNr  guifg=#00c000  ctermfg=cyan

hi CursorLine guibg=#444444

hi Title guifg=#808080

hi VertSplit guifg=#000000 guibg=#808647
hi SpecialKey guifg=#293820

hi Identifier	ctermfg=6 guifg=#598de5
