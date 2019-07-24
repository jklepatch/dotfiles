" Init plugins
execute pathogen#infect()

" Quit vim if nerdtree is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle nerdTREE
map <C-n> :NERDTreeToggle<CR>

" Initialize ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable syntax highlighting
"syntax enable
if !exists("g:syntax_on")
    syntax enable
endif

" Solarized Theme config
set background=dark
colorscheme solarized

" Enable file specific behavior like syntax highlighting and specific behavior
filetype on
filetype plugin on
filetype indent on

" Line numbers are relative
set relativenumber


"""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""
" custom leader key binding, and remap another key to ,
let mapleader=','
nnoremap \ ,

" Remap switch to normal-mode key
inoremap ii <Esc>	

" Map semi-colon to colon to enter command mode more easily
map ; :
noremap ;; ;

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Indents
set autoindent
set smartindent
set expandtab
set shiftwidth=2 "space inserted by >> and << command
set softtabstop=2
set tabstop=2
set smarttab

"move vertically by visual line (useful for wrapped line) nnoremap j gj nnoremap k gk 
"Enter / Shift + Enter insert a line below above, without entering insert mode
nmap <CR> o<Esc>
nmap <right><CR> O<Esc>
nmap <left><CR> O<Esc>

"wild menu
set wildmenu

" Show matching parentheses
set showmatch

"Allow to delete characters before the first one we inserted in the current
"line (behavior of most text editors)
set backspace=2

"Search settings
set incsearch "search as characters are entered
set hlsearch "highlight matches
"turn off search highlight
nnoremap <leader>h :nohlsearch<CR> 

"NerdCommenter
nnoremap ,/ :call NERDComment(0,"toggle")<CR>

nnoremap <leader><leader> :BuffergatorToggle<CR> 
nnoremap <Space><Space> :BuffergatorToggle<CR> 

nnoremap <leader><space> :b#<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<Space>
nnoremap H ^
nnoremap L $

nnoremap cp :let @+ = expand("%")<CR>

"Always show status line
set laststatus=2

" HTML mappings
augroup HtmlCmds
  "Cancel any autocmd ran before
  autocmd! 
  autocmd Filetype html nnoremap <buffer> <leader>c I<!--<esc>A--><esc> "<buffer> restricts this mapping to the buffer only
  "autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 "Set
  "different tab setting just for html file
  "autocmd Filetype BufRead, BufWritePre *.html normal gg=G "Format html file
  "when reading new buffer and before writing to file
augroup END

" Enable syntax highlighting for jsdoc
let g:javascript_plugin_jsdoc = 1

" CTRLP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|*.swp\|.git\|bin\|venv\|build'
"let g:ctrlp_cmd = 'CtrlPMRU' does not work
"nnoremap <c-p> :CtrlPMRU<CR> does not work either..
nnoremap <c-m> :CtrlPMRU<CR>

" In normal mode %%/ expand to current directory
cabbr <expr> %% expand('%:p:h')

" Highlight current line and 80 characters limit
set cursorline
set colorcolumn=80

" Conveniences for switching between buffers
map gn :bn<CR>
map gp :bp<cR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

set autowrite
"command -nargs=? -bang Buffer if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif
"
"
" Buffergator (doesnt work?)
let g:buffergator_split_size = 90 " default 40
let g:buffergator_sort_regime = 'filepath'
let g:buffergator_show_full_directory_path = 0
