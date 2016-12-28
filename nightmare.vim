" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" A Modified version of Xcode 'Midnight'
"  Maintainer:	LdBeth <andpuke@foxmail.com>
" Last Change:	2016 Oct 18

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nightmare"

hi Normal		ctermbg=Black  ctermfg=White	  guibg=Black	  guifg=White
hi Comment		term=bold	   ctermfg=Green	  guifg=Green
hi Constant		term=underline ctermfg=LightGreen guifg=White	gui=NONE
hi Identifier	term=underline ctermfg=LightCyan  guifg=#00ffff
hi Ignore					   ctermfg=Black	  guifg=bg
hi PreProc		term=underline ctermfg=LightBlue  guifg=Wheat
hi Search		term=reverse					  guifg=White	guibg=Blue
hi Special		term=bold	   ctermfg=LightRed   guifg=Magenta
hi Statement	term=bold	   ctermfg=Magenta	  guifg=Magenta	gui=NONE
hi cCppString	term=bold	   ctermfg=Red 		  guifg=Red
hi String		term=bold	   ctermfg=Red 		  guifg=Red
hi Type						   ctermfg=LightGreen guifg=grey	gui=none
hi Error		term=reverse   ctermbg=Red	  ctermfg=White guibg=Red  guifg=White
hi Todo			term=standout  ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
" From the source:
hi Cursor										  guifg=Orchid	guibg=fg
hi CursorLine 				   ctermbg=238		  cterm=NONE
hi CursorColumn				   ctermbg=52		  cterm=NONE
hi Directory	term=bold	   ctermfg=LightCyan  guifg=Cyan
hi ErrorMsg		term=standout  ctermbg=DarkRed	  ctermfg=White guibg=Red guifg=White
hi IncSearch	term=reverse   cterm=reverse	  gui=reverse
hi VertSplit	ctermbg=Gray   ctermfg=Gray		  guibg=Gray 	guifg=Gray
hi LineNr		term=underline ctermfg=Gray						guifg=Gray
hi ModeMsg		term=bold	   cterm=bold		  gui=bold
hi MoreMsg		term=bold	   ctermfg=LightGreen gui=bold		guifg=SeaGreen
hi NonText		term=bold	   ctermfg=Blue		  gui=bold		guifg=Blue
hi Question		term=standout  ctermfg=LightGreen gui=bold		guifg=Cyan
hi SpecialKey	term=bold	   ctermfg=LightBlue  guifg=Cyan
hi StatusLine	term=reverse,bold cterm=reverse   gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse   cterm=reverse ctermfg=Gray gui=NONE		guifg=white guibg=#333333
hi Title		term=bold	   ctermfg=LightMagenta gui=bold	guifg=Pink
hi WildMenu		term=reverse   ctermbg=DarkBlue   ctermfg=White	guibg=SkyBlue 	guifg=White
hi Pmenu					   ctermbg=White 	  ctermfg=Black guibg=White 	guifg=Black
hi PmenuSel		term=reverse   ctermbg=DarkBlue   ctermfg=White guibg=DarkBlue 	guifg=White
hi WarningMsg	term=standout  ctermfg=LightRed   guifg=Red
hi Visual		term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=darkgreen
