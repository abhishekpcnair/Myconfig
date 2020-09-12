" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
" runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" let mapleader =","
" set nocompatible

" General Settings
set number relativenumber
set nu rnu
set list
set cc =180
syntax on
set undofile
set undodir=~/padmabl/.vim/undo
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus
set updatetime=100
call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/ajh17/VimCompletesMe.git'
  Plug 'mattn/emmet-vim'
  Plug 'djoshea/vim-autoread'
  Plug 'ajmwagar/vim-deus'
  Plug 'Yggdroot/indentLine'
  Plug 'idbrii/vim-ack'
  " Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/vim-github-dashboard'
  Plug 'jreybert/vimagit'
  Plug 'powerline/powerline'
  Plug 'https://github.com/airblade/vim-gitgutter.git'
  Plug 'itchyny/lightline.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  Plug 'Lokaltog/powerline'
  Plug 'arcticicestudio/nord-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'srcery-colors/srcery-vim'
  " Plug 'lucasprag/simpleblack'
  " Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'Chiel92/vim-autoformat'
  Plug 'rapphil/vim-python-ide'
  " Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()
" Enable true color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif
" set t_Co=256
" set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme dracula
let mapleader = "e"
let maplocalleader = "z"

" Key mapping for vim-autoformat
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

autocmd FileType python inoremap <LocalLeader>c '''<CR><Tab>Return type --><CR>parameters--> <CR>'''<CR>
let g:autoformat_verbosemode=1

" USEFUL KEY MAPPINGS
:inoremap qq <Esc>
:map aa :w<CR>
" For Pio to run
:map <LocalLeader>q :! clear && pio run<Enter>
:map <LocalLeader>w :! clear && pio run -t upload<Enter>
" For window change
:map <LocalLeader>h <C-w>h
:map <LocalLeader>j <C-w>j
:map <LocalLeader>k <C-w>k
:map <LocalLeader>l <C-w>l
"Python completor for python 3
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_indent =1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length =800
let g:pymode_preview_height = &previewheight
let g:pymode_options = 1
" Python Auto completor Completor.vim

" Airline options
let g:airline_theme = "deus"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


" Buffer key bindings
:map <Leader>1 :buffer 1<CR>
:map <Leader>2 :buffer 2<CR>
:map <Leader>3 :buffer 3<CR>
:map <Leader>4 :buffer 4<CR>
:map <Leader>5 :buffer 5<CR>
:map <Leader>6 :buffer 6<CR>
:map <Leader>7 :buffer 7<CR>
:map <Leader>8 :buffer 8<CR>
:map <Leader>9 :buffer 9<CR>
:map <Leader>10 :buffer 10<CR>
:map <Leader>11 :buffer 11<CR>
:map <Leader>l :buffers<CR>

" Mark down setup
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
set conceallevel=2
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" Python commenting setup
autocmd FileType python inoremap ;c <CR>"""<CR>"""<CR>
autocmd FileType python inoremap ;t <CR>try:<CR>logger = logging.getLogger('')<Esc>1h
autocmd FileType python inoremap ;e <CR>except Exception as e:<CR>logger.error("Some error in ")<Esc>2h

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
