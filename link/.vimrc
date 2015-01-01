set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'chase/vim-ansible-yaml'
Bundle 'chriskempson/base16-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'edkolev/tmuxline.vim'
Bundle 'gmarik/vundle'
Bundle 'groenewege/vim-less'
Bundle 'jalcine/cmake.vim'
Plugin 'Keithbsmiley/swift.vim'
Bundle "pangloss/vim-javascript"
Bundle "Raimondi/delimitMate"
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Valloric/YouCompleteMe'
Bundle 'wincent/Command-T'
Bundle 'wting/cheetah.vim'
call vundle#end()
filetype plugin indent on
syntax enable

" Default indent formatting
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

" Color scheme
set background=dark
" let g:solarized_termcolors=256
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
colorscheme solarized

set number
set list
set listchars=tab:>.
autocmd FileType cpp set tabstop=2|set shiftwidth=2|set expandtab
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Enforce not using insert mode for navigation
inoremap kj <Esc>
set timeoutlen=200
:au FocusLost * :set number
:au FocusGained * :set relativenumber
:set relativenumber
let g:airline_powerline_fonts = 1
set laststatus=2

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Workaround
let g:CommandTTraverseSCM = 'pwd'
let g:clang_user_options='|| exit 0'

" Key binding for moving between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
:command WQ wq
:command Wq wq
:command W w
:command Q q
