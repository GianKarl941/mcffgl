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
set autowrite



"####################################
"# filetype and syntax highlighting #
"####################################

" base highlighting
set syntax=vim

" html highlighting
set syntax=html

" markdown highlighting
set syntax=markdown

" Enable use of the mouse for all modes
if has('mouse')
      set mouse=a
  endif

" Set GUI colors for the terminal
set tgc 

" Copy and pasting in Vim to other programs
vnoremap <C-c> "+y
map <C-c> "+p

" name of the used terminal
set term=xterm-256color

" alias for 'term'
set tty=xterm-256color


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


" quicker window switching 
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 
  
" quicker window resize 
nnoremap <C-S-Left> <C-w>< 
nnoremap <C-S-Right> <C-w>> 
nnoremap <C-S-Up> <C-w>+ 
nnoremap <C-S-Down> <C-w>-

" show the editing mode on the last line              
set showmode

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
set foldmethod=manual

" set to dark background
set background=dark

" colorschemes for vim/nvim
colorscheme evening





" Initialize plugin system 
call plug#begin('~/.vim/plugged')

" VIM Table Mode for instant table creation. https://github.com/dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode', { 'for': ['md', 'markdown']}

" css/less/sass/html color preview for vim. https://github.com/gko/vim-coloresque
Plug 'gorodinskiy/vim-coloresque'

call plug#end()


