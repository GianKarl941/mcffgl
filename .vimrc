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

" colorscheme for vim/neovim (still need some fixing to make this work)
colorscheme 

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

" Filetype detection
filetype indent on
filetype plugin on

" Enable use of the mouse for all modes
if has('mouse')
      set mouse=a
  endif

" Set GUI colors for the terminal
set tgc 

" Copy and pasting in Vim to other programs
vnoremap <C-c> "+y
vnoremap <C-c> "+p


" name of the used terminal
set term=xterm-256color

" alias for 'term'
set tty=xterm-256color

if !has('gui_running')
  set t_Co=256
endif

" status bar for lightline.vim plugins\
set laststatus=2

" Show the commends
set showcmd

" Expanding the tab
set expandtab

" Setting up the guicursor
set guicursor=

" Set number
set nu

" Set relative number
set relativenumber

" No highlight search
set nohlsearch

" Hide the status info
set hidden

" disabling wrap
set nowrap
set smartcase

" other
set incsearch
set scrolloff=8
set termguicolors
set signcolumn=yes
set colorcolumn=80
set noshowmode
set hidden

" quicker window switching
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 
  
" quicker window resize 
nnoremap <S-Left> <C-w>< 
nnoremap <S-Right> <C-w>> 
nnoremap <S-Up> <C-w>+ 
nnoremap <S-Down> <C-w>-

" Don't show the editing mode on the last line              
set noshowmode

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



" Initialize plugin system 
call plug#begin('~/.vim/plugged')

" VIM Table Mode for instant table creation. https://github.com/dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode', { 'for': ['md', 'markdown']}

" css/less/sass/html color preview for vim. https://github.com/gko/vim-coloresque
Plug 'gko/vim-coloresque'

" Community Gruvbox
Plug 'gruvbox-community/gruvbox'

" Lightline vim for the status bar
Plug 'itchyny/lightline.vim'
" dependecies tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" File explorer for vim
Plug 'lambdalisue/fern.vim'

" Centering text in vim
Plug 'junegunn/goyo.vim'

" Vi-instant-markdown_viewer
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

call plug#end()



" VIM table mode configuration
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" lightline vim
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 
      \ 'modified': '%M',
      \ 'paste': '&paste',
      \
      \
      \ }


" Community Gruvbox
let g:gruvbox_italic=1



" fern.vim file explorer
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 0

nnoremap <C-t> :Fern . -drawer -reveal=% -toggle -width=35 <CR>

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Configuration for goyo

nnoremap <C-x> :Goyo x48 <CR>
nnoremap <S-x> :Goyo! <CR>





" Configuration for vin-instant-markdown

"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
