set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
" !! make sure to use single quotes for plugins !!

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" color scheme
Plug 'joshdick/onedark.vim'
	" language pack for vim
	Plug 'sheerun/vim-polyglot'

" orgmode
Plug 'jceb/vim-orgmode'

" syntastic 
Plug 'vim-syntastic/syntastic'
"
" rust
Plug 'rust-lang/rust.vim'

" initialize plugin system
call plug#end()

" enable color scheme
syntax on
colorscheme onedark

set relativenumber
set number

if (has("termguicolors"))
	set termguicolors
endif

set tabstop=4
set shiftwidth=4
set list
set splitright
set splitbelow

" Use <cr>, <c-space or <tab> to confirm completion or select first entry,
" `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <c-space> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<c-space>"
inoremap <expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <expr> <c-l> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<c-l>"

" navigate completion list with c-j and c-k
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<C-g>u\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<C-g>u\<c-k>"


" org mode
let g:org_agenda_files = ['~/GTD/gtd.org']
