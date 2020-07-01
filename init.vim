set nocompatible
filetype off

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(expand('~/.vim/plugged'))

"" Browsing
Plug 'scrooloose/nerdtree'
if executable('fzf')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
else
    Plug 'kien/ctrlp.vim'
endif
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" Complete and snippets
" Plug 'neoclide/coc.nvim', { 'for': ['javascript'], 'do': { -> coc#util#install() }}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maralla/completor.vim', { 'for': ['python', 'cpp'] }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

"" Syntax
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale', { 'for': ['python', 'javascript'], 'do': 'pip install isort flake8' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'ntpeters/vim-better-whitespace'
Plug 'kevinoid/vim-jsonc'

"" Theme, Colors and icons
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug '~/projetos/agua'

"" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

"" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }

"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }

call plug#end()
filetype plugin indent on

"" Colorscheme.
syntax on
silent! colorscheme one
set relativenumber
set background=dark
set ruler
set cursorline
hi CursorLineNr cterm=Bold guibg=#333333

set foldtext=v:folddashes
set foldopen-=block
if (has("termguicolors"))
    set termguicolors
endif

"" Gui
if has("macunix")
    set guifont=monofur\ Nerd\ Font\ Complete:h14
else
    set guifont=monofur\ Nerd\ Font\ Complete:h14
    set t_Co=256
endif
set guioptions-=r
set guioptions-=L
set guioptions-=m
set guioptions-=T

"" Enconding.
set binary
set bomb
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

"" Native indentation and
" configure spaces instead of tabs.
set autoindent
set smartindent
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set nu

set ttyfast
set timeoutlen=1000 ttimeoutlen=0
" set updatetime=300
set nolazyredraw

" set hidden
" set cmdheight=2
" set shortmess+=c
" set signcolumn=yes

augroup vim-python
    autocmd!
    autocmd FileType python setlocal
                \ expandtab
                \ shiftwidth=4
                \ colorcolumn=79
                \ tabstop=8
                \ formatoptions+=croq
                \ softtabstop=4
augroup END


augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup html
    autocmd!
    autocmd FileType html,json,css,scss,javascript,typescript setlocal
                \ expandtab
                \ shiftwidth=2
                \ tabstop=2
                \ formatoptions+=croq
                \ softtabstop=2
augroup END

"" Search
set incsearch
set ignorecase
set hlsearch

"" Backup
set nobackup
set noswapfile

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

"" WebDevIcons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

"" Completor
let g:completor_node_binary = '/usr/local/bin/node'
let g:completor_clang_binary = '/usr/bin/clang++'
let g:completor_disable_buffer = 0
let g:completor_disable_filename = 0
let g:completor_clang_disable_placeholders = 1
noremap <silent> <C-d>  :call completor#do('definition')<CR>

if match(&runtimepath, 'completor') != -1
    echo "runtimpath completor"
    inoremap <expr> <tab> TabOrComplete()
endif

let g:user_emmet_expandabbr_key='<C-z>'
imap <expr> <C-z> emmet#expandAbbrIntelligent("\<C-z>")

"" Polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

"" Emmet
let g:user_emmet_settings = {
            \  'javascript' : {
            \      'extends' : 'jsx',
            \  },
            \}

""Airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

"" NERDTree.
" open nerd tree automatically when vim starts.
let NERDTreeMinimalUI = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 &&
            \ isdirectory(argv()[0]) &&
            \ !exists("s:std_in") | exe 'NERDTree'
            \ argv()[0] | wincmd p | ene | endif

augroup nerdtreehidecwd
    autocmd!
    autocmd FileType nerdtree setlocal
                \ conceallevel=3 | syntax match
                \ NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
    autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

let NERDTreeIgnore=['node_modules', 'www', 'public', '\.pyc$', '\~$', '\.db$', '\.sqlite$', '__pycache__']

let g:indentLine_fileTypeExclude = ['startify', 'tagbar', 'vimfiler', 'markdown' ]

"" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = '⚠'
let g:ale_sign_style_error = '⚠'
let g:ale_sign_style_warning = '⚠'
let g:ale_cache_executable_check_failures = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': [ 'prettier', 'eslint' ],
\   'json': [ 'prettier' ]
\}

"" Ctrlp
set wildignore+=*/www/*,*/public/,*/.git/*
set wildignore+=*/node_modules/*,*/env/*
set wildignore+=*/venv/*,*/__pycache__/*,
set wildignore+=*.pyc,*.db,*.sqlite,*.sqlite3


"" FZF
noremap <C-p> :FZF<CR>
noremap <C-f> :Rg<CR>
let g:fzf_preview_window = 'right:60%'
nmap <leader>y :History:<CR>
nmap <leader>b :Buffers<CR>

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
            \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
            \   <bang>0)

"" ripgrep
if executable('rg')
    set grepprg=rg\ --vimgrep
endif

"" leader key
:let mapleader = ","

"" No Ex mode
map Q <Nop>

"" Clear search
map <silent> <leader><space> :let @/=''<CR>

"" Find current word in quickfix
nnoremap <leader>fw :execute "vimgrep ".expand("<cword>")." %"<cr>:copen<cr>

"" Find last search in quickfix
nnoremap <leader>ff :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

"" Switching Windows
map  <C-j> <C-W>j
map  <C-k> <C-W>k
map  <C-h> <C-W>h
map  <C-l> <C-W>l

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Terminal
nnoremap <silent> <leader>sh :terminal<CR>

"" Buffer navigation
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

"" Close buffer
nnoremap <leader>c :bd<CR>

"" TagBar
nmap <F8> :TagbarToggle<CR>

"" NERDTree.
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" AleToggle
nnoremap <silent> <leader>at :ALEToggle<CR>

"" Prettier
" let g:prettier#exec_cmd_path = "/Users/Zenobio/.vim/plugged/vim-prettier/node_modules/.bin/prettier"
" let g:prettier#autoformat_require_pragma = 0
" let g:prettier#config#print_width = 80
" let g:prettier#config#tab_width = 4
" let g:prettier#config#use_tabs = 'false'
" let g:prettier#config#html_whitespace_sensitivity = 'css'


" Gitgutter
nnoremap <silent> <leader>gs :GitGutterToggle<CR>
nmap <silent> <leader>gp <Plug>GitGutterPrevHunk
nmap <silent> <leader>gn <Plug>GitGutterNextHunk
autocmd BufWritePost * GitGutter


"" Fugitive
nnoremap <silent> <leader>ga :Gwrite<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gsh :Gpush<CR>
nnoremap <silent> <leader>gll :Gpull<CR>
nnoremap <silent> <leader>gr :Gremove<CR>

"" Maintain in Visual Mode
vmap > >gv
vmap < <gv

"" Abbreviations
cnoreabbrev Qa qa
cnoreabbrev qA qa
cnoreabbrev Qa! qa!
cnoreabbrev Wa wa
cnoreabbrev wA wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Xa xa
cnoreabbrev xA xa
cnoreabbrev XA xa
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Q q

"" Move Entire Line with Shift
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <S-h> :vertical resize -5<CR>
nnoremap <S-l> :vertical resize +5<CR>
