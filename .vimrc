"#############################################################################
"# This is my .vimrc file for my text editing workflow                       #
"# And this will be seperated to the local config and to the                 #
"# plugin config so it would be easier to browser around the config          #
"# You can do anything what you want on my config; just have fun using it :D #
"# There's more info about these config as you scroll down the config so     #
"# no need to sweat about it                                                 #
"# enjoy :D                                                                  #
"#############################################################################

"######################################################################
"# Basic configuration for vim                                        #
"# This is where you can setup your vim config file without installing#
"# vim plugins                                                        #
"# you can learn them more by typing into the commands ':option'      #
"######################################################################

" Enabeling syntax highlighting 
syntax on

" indenting

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

"####################################
"# filetype and syntax highlighting #
"####################################

" base highlighting
set ft=vim
set syn=vim

" html highlighting
set ft=html
set syn=html

" bash highlighting
set ft=bash
set syn=bash

" Enable use of the mouse for all modes
if has('mouse')
      set mouse=a
  endif

" Copy and pasting it to other programs
vnoremap <C-c> "+y
map <c-p> "+p

set showcmd
set expandtab
set guicursor=
set nu
set nohlsearch
set hidden
set nowrap
set smartcase
set incsearch
set scrolloff=8
set termguicolors
set signcolumn=yes
set colorcolumn=80


" Display height for command window
set cmdheight=1

" Filetype detection
filetype indent on

" autocomplete commands for you
set wildmenu

" Highlighting similar brackets
set showmatch

" Code folding 
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent

" set to dark background
set background=dark

" colorschemes for vim/nvim
colorscheme evening 













" Setting up Vim-plugin
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system


"" MY OWN PLUGINS

call plug#end()



