" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "sich_off"

"*Comment               any comment
"
"*Constant		any constant
"       String		a string constant: "this is a string"
"       Character	a character constant: 'c', '\n'
"       Number		a number constant: 234, 0xff
"       Boolean		a boolean constant: TRUE, false
"       Float		a floating point constant: 2.3e10
"
"*Identifier       	any variable name
"       Function	function name (also: methods for classes)
"
"*Statement       	any statement
"       Conditional	if, then, else, endif, switch, etc.
"       Repeat		for, do, while, etc.
"       Label		case, default, etc.
"       Operator	"sizeof", "+", "*", etc.
"       Keyword		any other keyword
"       Exception	try, catch, throw
"
"*PreProc       	generic Preprocessor
"       Include		preprocessor #include
"       Define		preprocessor #define
"       Macro		same as Define
"       PreCondit	preprocessor #if, #else, #endif, etc.
"
"*Type       		int, long, char, etc.
"       StorageClass	static, register, volatile, etc.
"       Structure	struct, union, enum, etc.
"       Typedef	A typedef
"
"*Special       	any special symbol
"       SpecialChar	special character in a constant
"       Tag		you can use CTRL-] on this
"       Delimiter	character that needs attention
"       SpecialComment	special things inside a comment
"       Debug		debugging statements
"
"*Underlined		text that stands out, HTML links
"
"*Ignore			left blank, hidden
"
"*Error			any erroneous construct
"
"*Todo			anything that needs extra attention; mostly the
"			keywords TODO FIXME and XXX

hi Comment          ctermfg=Blue        ctermbg=0           cterm=NONE
hi Constant         ctermfg=DarkRed     ctermbg=0           cterm=NONE
hi Identifier       ctermfg=White       ctermbg=0           cterm=NONE
hi Statement        ctermfg=Yellow      ctermbg=0           cterm=NONE
hi PreProc          ctermfg=Gray        ctermbg=0           cterm=NONE
hi Type             ctermfg=Green       ctermbg=0           cterm=NONE
hi Special          ctermfg=Magenta     ctermbg=0           cterm=NONE

hi Folded           ctermfg=DarkGrey    ctermbg=0           cterm=NONE
hi LineNr           ctermfg=DarkGrey                        cterm=NONE
hi CursorLine                           ctermbg=DarkGrey    cterm=NONE
hi CursorColumn                         ctermbg=DarkGrey    cterm=NONE

