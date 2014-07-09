execute pathogen#infect()
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
"set wildmenu=list:longest
"set cursorline

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
map <C-t><up>	:tabr<cr>
map <C-t><down>	:tabl<cr>
map <C-t><left>	:tabp<cr>
map <C-t><right>	:tabn<cr>
nmap ,, :TagbarToggle<CR>
nnoremap <unique> <leader>t :MakeGreen %<CR>
nmap <Space> <C-d> 
nmap <M-Space> <C-u>
set mouse=a
autocmd FileType javascript compiler nodeunit
autocmd BufNewFile,BufRead *.spec.js compiler nodeunit

set nohlsearch 	" turn off highlighting for searched expressions
set incsearch 	" highlight as we search
set matchtime=5	"	matching chars blink for 5 seconds
set completeopt=menu,longest,preview " autocomplete options <C-p>
set showmatch		" show matching brackets

"------ Key bindings ------"
for n in range(97,122) " ASCII a-z
	let c = nr2char(n)
	exec "set <M-". c .">=\e". c
	exec "map \e". c ." <M-". c .">"
	exec "map! \e". c ." <M-". c .">"
endfor

" Lisp
autocmd FileType list,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp

" Javascript
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=78 shiftwidth=2
	autocmd FileType json set softtabstop=2 tabstop=8
	autocmd FileType json set expandtab 
	autocmd FileType json set foldmethod=syntax
augroup END
"autocmd BufRead,BufNewFile *.json setfiletype javascript
let javascript_enable_domhtmlcss=1

" Neocomplete config "
" 	Disable AutoComplPop "
"let g:acp_enableAtStartup=0
"let g:neocomplete#enable_at_startup=1
"let g:neocomplete#enable_smart_case=1
"let g:neocomplete#sources#syntax#min_keyword_length=3
"let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
"		Define dictionary "
"let g:neocomplete#sources#dictionary#dictionaries = {
"	\ 'default' : '',
"	\ 'vimshell' : $HOME.'/.vimshell_hist',
"	\ 'scheme' : $HOME.'/.gosh_completions'
"	\ }
"		Define keyword "
"if !exists('g:neocomplete#keyword_patterns')
"	let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default']='\h\w*'
"		Plugin key-mappings "
"inoremap <expr><C-g>	neocomplete#undo_completion()
"inoremap <expr><C-l>	neocomplete#complete_common_string()
"		Recommended key-mappings "
" 	<CR>: close popup and save indent
"inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function()<CR>
"function! s:neocomplete_cr_function()
"	return neocomplete#close_popup(). "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" 	<TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" 	<C-h>, <BS>: close popup and delete previous char
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplete#close_popup()
"inoremap <expr><C-e> neocomplete#cancel_popup()
" 	Close popup with Space
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"		AutoComplPop like behavior
"let g:neocomplete#enable_auto_select=1
"		Enable omni completion
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"		Enable heavy omni completion
"if !exists('g:neocomplete#sources#omni#input_patterns')
"	let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting
"  https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


let g:indent_guides_enable_on_vim_startup=1

" molokai theme "
"let g:molokai_original=1
let g:rehash256=1

" solarized theme "



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
