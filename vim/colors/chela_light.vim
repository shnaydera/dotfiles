" Vim color file
"
" Maintainer:   Stefan Karlsson <stefan.74@comhem.se>
" Last Change:  8 August 2006


set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="chela_light"


"Syntax Groups =============================================

hi comment      ctermbg=#fafafa   ctermfg=#339900   cterm=none

hi constant     ctermbg=#fafafa   ctermfg=#cc2222   cterm=none

hi identifier   ctermbg=#fafafa   ctermfg=#2222ff   cterm=none

hi statement    ctermbg=#fafafa   ctermfg=#2222ff   cterm=none

hi preproc      ctermbg=#fafafa   ctermfg=#2222ff   cterm=none
hi precondit    ctermbg=#fafafa   ctermfg=#cc00cc   cterm=none

hi type         ctermbg=#fafafa   ctermfg=#2222ff   cterm=none

hi special      ctermbg=#fafafa   ctermfg=#cc00cc   cterm=none
hi specialchar  ctermbg=#fafafa   ctermfg=#cc2222   cterm=underline

hi underlined   ctermbg=#fafafa   ctermfg=#2222ff   cterm=underline

hi error        ctermbg=#ff2222   ctermfg=#ffffff   cterm=none

hi todo         ctermbg=#339933   ctermfg=#ffffff   cterm=none


"General Groups ============================================

hi cursor       ctermbg=#000000   ctermfg=#ffffff   cterm=none
"  cursorim?
hi cursorcolumn ctermbg=#eeeeee                   cterm=none
hi cursorline   ctermbg=#eeeeee                   cterm=none

hi directory    ctermbg=#fafafa   ctermfg=#2222ff   cterm=none

hi diffadd      ctermbg=#66ff66   ctermfg=#000000   cterm=none
hi diffchange   ctermbg=#ffff00   ctermfg=#cccc99   cterm=none
hi diffdelete   ctermbg=#ff6666   ctermfg=#ff6666   cterm=none
hi difftext     ctermbg=#ffff00   ctermfg=#000000   cterm=none

hi errormsg     ctermbg=#ff2222   ctermfg=#ffffff   cterm=none

hi vertsplit    ctermbg=#2222ff   ctermfg=#2222ff   cterm=none

hi folded       ctermbg=#eeeeee   ctermfg=#2222ff   cterm=none
hi foldcolumn   ctermbg=#eeeeee   ctermfg=#999999   cterm=none

"  signcolumn?

hi incsearch    ctermbg=#ffbb00   ctermfg=#000000   cterm=none

hi linenr       ctermbg=#fafafa   ctermfg=#cccccc   cterm=none

hi matchparen   ctermbg=#cccccc                   cterm=none

hi modemsg      ctermbg=#fafafa   ctermfg=#999999   cterm=none

hi moremsg      ctermbg=#339900   ctermfg=#ffffff   cterm=none

hi nontext      ctermbg=#fafafa   ctermfg=#999999   cterm=none

hi normal       ctermbg=#fafafa   ctermfg=#222222   cterm=none

hi pmenu        ctermbg=#cccccc   ctermfg=#222222   cterm=none
hi pmenusel     ctermbg=#2222ff   ctermfg=#ffffff   cterm=none
"  pmenusbar?
"  pmenuthumb?

hi question     ctermbg=#339900   ctermfg=#ffffff   cterm=none

hi search       ctermbg=#ffff00   ctermfg=#000000   cterm=none

hi specialkey   ctermbg=#fafafa   ctermfg=#cc00cc   cterm=none

hi spellbad                                     cterm=undercurl ctermsp=#ff2222
hi spellcap                                     cterm=undercurl ctermsp=#ff2222
hi spelllocal                                   cterm=undercurl ctermsp=#cc2222
hi spellrare                                    cterm=undercurl ctermsp=#22cc22

hi statusline   ctermbg=#2222ff   ctermfg=#ffffff   cterm=none
hi statuslinenc ctermbg=#2222ff   ctermfg=#999999   cterm=none

hi tabline      ctermbg=#cccccc   ctermfg=#222222   cterm=none
hi tablinesel   ctermbg=#2222ff   ctermfg=#ffffff   cterm=none
hi tablinefill  ctermbg=#aaaaaa   ctermfg=#aaaaaa   cterm=none

hi title        ctermbg=#fafafa   ctermfg=#6666ff   cterm=none

hi visual       ctermbg=#cccccc   ctermfg=#333333   cterm=none
"  visualnos?

hi warningmsg   ctermbg=#fafafa   ctermfg=#ff0000   cterm=none

hi wildmenu     ctermbg=#339900   ctermfg=#ffffff   cterm=none

