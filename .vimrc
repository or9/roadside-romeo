execute pathogen#infect()
set t_Co=256
set nocompatible
syntax on
colo default
set number
set shiftwidth=2
set tabstop=2
set shiftround
set copyindent
set autoindent
filetype plugin indent on
set ignorecase	" ignore case in searches
set smartcase		" unless there's a capital letter
set showcmd
set scrolloff=5
set wildmenu " ex., :e <tab> shows list of available <e> commands
set visualbell
set noerrorbells
set backspace=indent,eol,start
set cursorline
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
map <C-t><up>	:tabr<cr>
map <C-t><down>	:tabl<cr>
map <C-t><left>	:tabp<cr>
map <C-t><right>	:tabn<cr>
nmap ,, :TagbarToggle<CR>
nnoremap <unique> <leader>t :MakeGreen %<CR>
nmap <Space> <C-d> 
nmap <M-Space> <C-u>
nnoremap <C-n> :NERDTreeToggle<CR>
set mouse=a
autocmd FileType javascript compiler nodeunit
autocmd BufNewFile,BufRead *.spec.js compiler nodeunit

set nohlsearch 	" turn off highlighting for searched expressions
set incsearch 	" highlight as we search
set matchtime=5	"	matching chars blink for 5 seconds
set completeopt=menu,longest,preview " autocomplete options <C-p>
set showmatch		" show matching brackets

"------ Key bindings ------"
"for n in range(97,122) " ASCII a-z
"	let c = nr2char(n)
"	exec "set <M-". c .">=\e". c
"	exec "map \e". c ." <M-". c .">"
"	exec "map! \e". c ." <M-". c .">"
"endfor


" Lisp
"autocmd FileType list,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp

" Javascript
"au! BufRead,BufNewFile *.json set filetype=json
"augroup json_autocmd
"	autocmd!
"	autocmd FileType json set autoindent
"	autocmd FileType json set formatoptions=tcq2l
"	autocmd FileType json set textwidth=78 shiftwidth=2
"	autocmd FileType json set softtabstop=2 tabstop=8
"	autocmd FileType json set expandtab 
"	autocmd FileType json set foldmethod=syntax
"augroup END
"autocmd BufRead,BufNewFile *.json setfiletype javascript

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let javascript_enable_domhtmlcss=1

let g:indent_guides_enable_on_vim_startup=1
"let g:gitgutter_highlight_lines=1

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline#extensions#tabline#enabled=1

" molokai theme "
"let g:molokai_original=1
let g:rehash256=1


" solarized theme "
"let g:solarized_termcolors=256
"set background=dark

"colorscheme solarized
colorscheme	molokai 

" Open a file and type :colorscheme followed by a space
" Press tab to cycle (or shift-tab to reverse).
" Press enter to immediately select the scheme
" 
" Available colors are…
"
" /usr/share/vim/vim73/colors/blue.vim
" /usr/share/vim/vim73/colors/darkblue.vim
" /usr/share/vim/vim73/colors/default.vim
" /usr/share/vim/vim73/colors/delek.vim
" /usr/share/vim/vim73/colors/desert.vim
" /usr/share/vim/vim73/colors/elflord.vim
" /usr/share/vim/vim73/colors/evening.vim
" /usr/share/vim/vim73/colors/koehler.vim
" /usr/share/vim/vim73/colors/morning.vim
" /usr/share/vim/vim73/colors/murphy.vim
" /usr/share/vim/vim73/colors/pablo.vim
" /usr/share/vim/vim73/colors/peachpuff.vim
" /usr/share/vim/vim73/colors/ron.vim
" /usr/share/vim/vim73/colors/shine.vim
" /usr/share/vim/vim73/colors/slate.vim
" /usr/share/vim/vim73/colors/torte.vim
" /usr/share/vim/vim73/colors/zellner.vim
