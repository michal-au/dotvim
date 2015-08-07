"automatic reoloading of .vimrc
autocmd! bufwritepost .vimrc source %


"Rebind <Leader> key
let mapleader=","

set guioptions-=T   "remove the icon bar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
" 'hide' pale gray areas by ~/.gtkrc-2.0


"firefox-like tab navigation
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-S-tab> :tabprevious<CR>

" vim-airline
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "murmur"
let g:airline_powerline_fonts = 1

set hidden
nnoremap <C-tab>   :bnext<CR>
nnoremap <C-S-tab> :bprevious<CR>
nmap <leader>t :enew<cr>
nnoremap <leader>q :bp<cr>:bd #<cr>

"set swap directory:
set directory=~/.vim/swap

"better copy & paste behaviour
"set pastetoggle=<F2>
"set clipboard=unnamed


"map sort function to a key
vnoremap <Leader>s :sort<CR>

"easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"copy - paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"navigating among splits
nnoremap <A-Left> <C-W><C-H>
nnoremap <A-Right> <C-W><C-L>
nnoremap <A-Down> <C-W><C-J>
nnoremap <A-Up> <C-W><C-K>
set splitbelow
set splitright

"Color scheme
set t_Co=256
colorscheme wombat256mod

"syntax highlighting
filetype off
filetype plugin indent on
syntax on

"showing line numbers and length
set number	"show line numbers
"set tw=79	"width of lines
set nowrap	"prevent automatic wrapping on load
set fo-=t	"prevent automatic wrapping while typing
"set colorcolumn=80
"highlight ColorColumn ctermbg=Black

"easier formatting of paragraphs
vmap Q gq 
nmap Q gqap

"history
set history=700
set undolevels=700

" Tabstops
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Setup Pathogen to manage the plugins    
execute pathogen#infect()

nmap <leader>l iprint "\n{}\n".format()<Esc>i

"NERDTree
nmap <leader>nt :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$', '\.hi', '\.o']
if has("autocmd")
    " autorun nerdtree
    autocmd VimEnter * NERDTree
endif

"================================
" PYTHON IDE SETUP
"================================

"Powerline setup
set laststatus=2

"Ctrlp setup
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"Jedi setup
" let g:jedi#use_splits_not_buffers = "right"
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_options_colorcolumn = 0
" jedi-vim disable documentation on autocomplete
autocmd FileType python setlocal completeopt-=preview
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_folding = 0
let g:pymode_lint_unmodified = 1
let g:pymode_lint_ignore = "E501"
let g:pymode_lint_on_fly = 0
let g:pymode_virtualenv = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" rope settings
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-Space>'

" jedi-vim
let g:jedi#show_call_signatures = "0"
let g:jedi#usages_command = "<leader>N"

""Python-mode setup
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts=1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extend_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

""Navigation through omnicomplete option list
"set completeopt=longest,menuone
"function! OmniPopup(action)
"    if pumbisible()
"        if a:action=='j'
"            return "\<C-N>"
"        elseif a:action=='k'
"            return "\<C-P>"
"        endif
"    endif
"    return a:action
"endfunction

"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"Python_editing.vim - folding setup
set nofoldenable

"Python execute code
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear;python' shellescape(@%, 1)<CR>
