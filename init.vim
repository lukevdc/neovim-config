" Plugins
" -------
call plug#begin('~/.vim/plugged')

" Theme
Plug 'tomasiser/vim-code-dark' 

" Support for language lsp's
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround brackets, parentheses, quotes
Plug 'tpope/vim-surround'

" Customize status bar
Plug 'vim-airline/vim-airline'

" Smart comment out lines for all languages
Plug 'tpope/vim-commentary'

" Git support and options for git commands in vim
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Suggestions to fix code errors
Plug 'dense-analysis/ale'

" Support for virtual environments
Plug 'jmcantrell/vim-virtualenv'

" Standard rust plugin
Plug 'rust-lang/rust.vim'

" Auto pair brackets
Plug 'tmsvg/pear-tree'

call plug#end()


" Mappings
" --------
" To more quickly exit insert mode
inoremap kj <Esc>

" Move by visual line
nn j gj
nn k gk
vn j gj
vn k gk

" Move to end of paste or yank
vn <silent> y y`]
vn <silent> p p`]
nn <silent> p p`]

" Reselect text after shift
vn > >gv
vn < <gv

" Save fast
nn <leader>w :w<cr>

" Quit fast
nn <silent><leader>q :q<cr>

" Edit .vimrc
nn <silent><leader>e :vs $MYVIMRC<cr>

" Always append to end of line
nn a A

" Go to beginning/end of line
nn H ^
nn L g%
nn cL c$

" Prevent single character deletion from overwriting yank register
nn x "_x

" Shift selection up and down in a pretty way
vn J :m '>+1<CR>gv=gv
vn K :m '<-2<CR>gv=gv

" For coc plugin, make enter key select option
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" For coc plugin use <tab> for trigger completion and navigate to the next complete line
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" Helpful Sets
" ------------
" Enable mouse usage in terminals
set mouse=a

" Yank saves to clipboard
set clipboard=unnamedplus

" Set completeopt to have a better completion experience
" :help completeopt
"	menuone: 
"	noinsert: Do not insert text until a selection is made
"	noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c		

" Syntax highlighting
syntax on

" Allow truecolor
set termguicolors

" Offset scrolling by 2 lines [surround] this
set scrolloff=2

" Indent when wrapping runover lines
set breakindent

" Don't add a new line
set nofixeol

" Visually break lines on words
set linebreak

" Copy indent from last line when starting new line
set autoindent

" Lazy redraw
set lazyredraw

" At the start of line, <Tab> inserts shiftwidth spaces
"			<Bs> deletes shiftwidth spaces
set et ai si
set smarttab

" Tabs are just spaces
set expandtab

" Tabs are 2 spaces
set tabstop=2

" Using > goes 2 spaces
set shiftwidth=2
set softtabstop=2

" Intuitive splits
set splitright
set splitbelow

" Show line numbers on the side
set number

" Don't show the keys being typed
set noshowcmd

" No sounds (Super nice!)
set noerrorbells

" No visual warnings
set novisualbell

" Permanent undo (Super nice! Allows for you to always undo text, even if the file was closed)
set undodir=~/.vimdid
set undofile

" Hide tildes for empty lines
" This is currently an issue (https://github.com/neovim/neovim/issues/2067)
let &fcs='eob: '

" Hide startup message
set shortmess+=I

" Hide name
set laststatus=0

" Hide row,col
set noruler

" Show effects of commands in real time
if has('nvim')
  set inccommand=nosplit
endif


" Commands
" --------
" Use // for comments
autocmd FileType c,cpp,cs,java setlocal commentstring==//\ %s

" Theme
colorscheme codedark


" Optional
" --------
" Spellchecking
" set spell
" setlocal spell spelllang=en_us
" ino <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u



" Not Sure Of
" -----------
aug disable_comments
    au!
    au FileType vim setlocal formatoptions-=c fo-=r fo-=o
aug END

" Have a fixed column for the diagnositcs to appear in
" This removes the jitter when warnings/errors flow in
" NOTE: As of right now this is weird. Adds a grey bar
"       to the left-hand side. Looks bad.
" set signcolumn=yes

set formatoptions=l

