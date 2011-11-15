map <silent> <F5>  :w<CR>:make<CR>
map <silent> <F6>  :w<CR>:make run<CR>
"map <silent> <F10> :cal VimCommanderToggle()<CR>
map <silent> <F12> :sh<CR>

if
      \ &term == "screen" ||
      \ &term == "xterm" ||
      \ &term == "rxvt" ||
      \ &term == "rxvt-unicode"
  set title
endif

if &term == "screen" || &term == "xterm"
  set t_Co=256
elseif &term == "rxvt" || &term == "rxvt-unicode"
  set t_Co=88
else
  set t_Co=16
endif
"set t_Co=16
"set t_Co=88
"set t_Co=256

" show unneeded whitespace characters
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
":match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

colorscheme sich_off

syntax on
"set cindent
filetype indent on
set wildmenu
set wildmode=list:longest
"set cinoptions=g0,(0
set cinoptions=(0,g0
set cmdheight=2
set dictionary=/usr/share/dict/words
set foldmethod=marker

set hlsearch
set ruler
set number
"set cursorline
"set cursorcolumn
set expandtab
set shiftwidth=2
set softtabstop=2
set cryptmethod=blowfish

" language mapping
"{{{"
" russian
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
" ukrainian addition
map ї ]
map і s
map є '
map Ї }
map І S
map Є "
"}}}"

autocmd BufRead,BufNewFile .bash_aliases
      \ let b:is_bash = 1|set ft=sh
autocmd BufRead,BufNewFile *.mdwn
      \ set textwidth=76 |
      \ set autoindent |
      \ set formatoptions-=c |
      \ set filetype=markdown
