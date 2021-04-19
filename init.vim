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


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Window splitting / movement

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>



"###############################################################
"# \       / _______  | __  __        |___  ||           ___   #
"#  \     /     |     |/  \/  \       |   \ ||  |    |  /   \| #
"#   \   /      |     |   ||  |  ___  |___/ ||  |    | |     | #
"#    \ /       |     |   ||  | |___| |     ||  |    |  \___/| #
"#     V     ___|___  |   ||  |       |     ||   \__/      | | #
"#                                                         | | #
"#                                                        /_/  #
"###############################################################                                                                    


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
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



" My Installed Plugins

"Auto Pairs

Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

" Deoplete

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" NERDtree

Plug 'preservim/nerdtree'

" Vim denite

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()


" Config of NERDtree



" key mappings

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif


" Use deoplete.
let g:deoplete#enable_at_startup = 1                                                     
                                                                                                                                                       
" Pass a dictionary to set multiple options                                                                                                      
call deoplete#custom#option({                                                                                                                    
\ 'auto_complete_delay': 200,                                                                                                                    
\ 'camel_case': v:true, 
\ 'omni_patterns': {}, 
\ 'refresh_backspace': v:true, 
\ 'ignore_case': v:true})

set completeopt+=noselect                                                                                             
call deoplete#custom#option('omni_patterns', {                                                                        
\ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],                                                                        
\ 'java': '[^. *\t]\.\w*',                                                                                            
\ 'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],                                                                       
\ 'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],                                                                      
\ 'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],                                                                        
\})


" denite.vim

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
