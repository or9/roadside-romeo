set nocompatible 			" be iMproved, required
filetype off          " required

"execute pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

call vundle#begin()

" Let Vundle manage Vundle
"Bundle 'gmarik/vundle'
Plugin 'gmarik/vundle'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern'
Plugin 'marijnh/tern_for_vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/NERDTree'
Plugin 'airblade/vim-gitgutter'
Plugin 'Tpope/vim-surround'
Plugin 'taglist.vim'
Plugin 'leshill/vim-json'
Plugin 'jelera/vim-JavaScript-syntax'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'walm/jshint.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'statianzo/vim-jade'
Plugin 'xsbeats/vim-blade'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'roman/golden-ratio'
Plugin 'ap/vim-css-color'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

call vundle#end()

set term=xterm-256color
set t_Co=256
let g:solarized_termcolors=256
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=grey term=bold
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_always_populate_location_list=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:ycm_path_to_python_interpreter="/usr/local/bin/python"

"let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib"
set lazyredraw
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
set magic
set showcmd
set scrolloff=5
set wildmenu " ex., :e <tab> shows list of available <e> commands
set visualbell
set noerrorbells
set ruler
set hidden
set backspace=indent,eol,start
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
map <C-t><up>	:tabr<cr>
map <C-t><down>	:tabl<cr>
map <C-t><left>	:tabp<cr>
map <C-t><right>	:tabn<cr>
nmap ,, :TagbarToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bw :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nnoremap <Tab> :bnext<CR>:redraw<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>
"Javascript things
nnoremap <C-y> :TernDef<CR>
nnoremap <C-u> :TernRefs<CR>
nnoremap <C-t> :TernType<CR>
"nnoremap <C-i> :TernDoc<CR>
nnoremap <C-o> :TernRename<CR>
call togglebg#map("<F5>")
"autocmd FileType javascript compiler nodeunit
"autocmd BufNewFile,BufRead *.spec.js compiler nodeunit
"autocmd BufNewFile,BufRead *_test.js compiler nodeunit
autocmd BufWritePre,BufRead *.js|json :normal gg=G

set nohlsearch 	" turn off highlighting for searched expressions
set incsearch 	" highlight as we search
set matchtime=5	"	matching chars blink for 5 seconds
"set completeopt=menu,longest,preview " autocomplete options <C-p>
set completeopt=menu,longest " autocomplete options <C-p> " preview was really annoying
set showmatch		" show matching brackets

" Lisp
"autocmd FileType list,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp

" Javascript
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let javascript_enable_domhtmlcss=1

"let g:gitgutter_highlight_lines=1

set encoding=utf-8
"""""""""""""""""""""""""""
"				Airline						"
"""""""""""""""""""""""""""
let g:airline_theme 						= "powerlineish"
let g:airline_enable_branch			= 1
let g:airline_enable_syntastic	= 1
let g:airline_enable_statusline	= 1
let g:airline_powerline_fonts 	= 1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
function! s:tagbar_integration()
  " statusline tells you what function you're in
endfunction
"set statusline+=%{fugitive#statusline()}
set noshowmode
set cmdheight=1
let g:bufferline_echo=0
autocmd QuickFixCmdPost *grep* cwindow
" molokai theme "
"let g:molokai_original=1
let g:rehash256=1
"let g:indentLine_color_term = 8
"let g:indentLine_char = '│'
hi Normal guibg=NONE ctermbg=NONE

augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq21
	autocmd FileType json set shiftwidth=2
	autocmd FileType json set softtabstop=2 tabstop=2
	autocmd FileType json set expandtab
"	autocmd FileType json set foldmethod=syntax
augroup END
let g:vim_json_syntax_conceal=0
let g:vim_json_syntax_concealCursor=1
"let g:indentLine_noConcealCursor=""

"au FileType javascript call JavaScriptFold()

"colorscheme solarized
"colorscheme	molokai 
set background=dark

set laststatus=2
let g:mustache_abbreviations = 1

"set mouse=""
" Open a file and type :colorscheme followed by a space
" Press tab to cycle (or shift-tab to reverse).
" Press enter to immediately select the scheme
" 
" Default available colors are…
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
