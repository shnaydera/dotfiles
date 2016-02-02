
set incsearch " incremental search

set ignorecase " case insensitive search ...
set smartcase  " ... unless search includes capital letters
 
set scrolloff=2 " keep 2 lines of context around cursor 
  
set visualbell " no beeps
set noerrorbells " no beeps
                
set title " terminal window shows title of file

imap ;; <Esc>
noremap <C-S>	:w<CR>
vnoremap <C-S>	<Esc>:w<CR><C-V>
inoremap <C-S>	<Esc>:w<CR>a

" Hitting enter on keyboard in command mode creates a newline
nmap <CR> o<Esc> 

" Color modifications
highlight Normal ctermbg=white
set background=light


if &t_Co >= 256 || has("gui_running")
	colorscheme developer 
endif

if &t_Co > 2 || has("gui_running")
	" switch syntax highlighting on
        " colorscheme evening 
	syntax on
endif

" Pathogen setup
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
