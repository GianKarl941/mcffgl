" ______  ___            ___    ______                             __________________     
"___   |/  /____  __    __ |  / /__(_)______ _________________    ___  __/__(_)__  /____ 
"__  /|_/ /__  / / /    __ | / /__  /__  __ `__ \_  ___/  ___/    __  /_ __  /__  /_  _ \
"_  /  / / _  /_/ /     __ |/ / _  / _  / / / / /  /   / /__      _  __/ _  / _  / /  __/
"/_/  /_/  _\__, /      _____/  /_/  /_/ /_/ /_//_/    \___/      /_/    /_/  /_/  \___/ 
"          /____/                                                                        

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

" Set background color
set background=dark
let g:colors_name="gruvbox"

" indenting

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set autowrite



"##########################################
"# filetype, syntax highlighting and more #
"##########################################

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
map <C-p> "+P
" For copying to both the clipboard and primary selection
vnoremap <C-c> "*y :let @+=@*<CR>

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

" efficient scolling
set lazyredraw

" disabling wrap
set nowrap

" incremental search
set incsearch

" Set the scrolloff to 8
set scrolloff=8

" specifies how command line completion works
set wim=full

" other
set termguicolors
set signcolumn=yes
set colorcolumn=80
set nocursorcolumn
set nocursorline
set lazyredraw

" display indentation guides
set list listchars=tab:┊`,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

" Higlights the tabs
" match Search /\%(\_^\s*\)\@<=\%(\%1v\|\%5v\|\%9v\)\s/

" quicker window switching
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 

" quicker window resize 
nnoremap <S-h> <C-w>< 
nnoremap <S-j> <C-w>- 
nnoremap <S-k> <C-w>+ 
nnoremap <S-l> <C-w>>

" Don't show the editing mode on the last line
set noshowmode

" Display height for command window
set cmdheight=1

" autocomplete commands for you
set wildmenu

" Highlighting similar brackets
set showmatch

" Code folding 
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=manual

" Word counter
map <F3> :w !detex \| wc -w<CR>

" New tab
nnoremap <silent> <S-t> :tabnew<CR>


" _    ___                             __               
"| |  / (_)___ ___              ____  / /_  ______ _    
"| | / / / __ `__ \   ______   / __ \/ / / / / __ `/    
"| |/ / / / / / / /  /_____/  / /_/ / / /_/ / /_/ /     
"|___/_/_/ /_/ /_/           / .___/_/\__,_/\__, /      
"                           /_/            /____/       

" Initialize plugin system 
call plug#begin('~/.vim/plugged')

" VIM Table Mode for instant table creation. https://github.com/dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode', { 'for': ['md', 'markdown']}

" css/less/sass/html color preview for vim. 
Plug 'gko/vim-coloresque'

" Community Gruvbox
Plug 'gruvbox-community/gruvbox'

" Asynchronous Lint Engine for vim
Plug 'dense-analysis/ale'

" It basically shows the git diff of every lines that you have edited
Plug 'airblade/vim-gitgutter'

" Lightline vim for the status bar
Plug 'itchyny/lightline.vim'
" dependecies tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" dependencies lightline-ale
Plug 'maximbaz/lightline-ale'

" File explorer for vim
Plug 'lambdalisue/fern.vim'

" Centering text in vim
Plug 'junegunn/goyo.vim'

" Vi-instant-markdown_viewer
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

" vim-simple-complete
Plug 'maxboisvert/vim-simple-complete'


call plug#end()

"                      __  _                            _    _                      
"  ___  ___   _ __   / _|(_)  __ _  _   _  _ __  __ _ | |_ (_)  ___   _ __   ___   
" / __|/ _ \ | '_ \ | |_ | | / _` || | | || '__|/ _` || __|| | / _ \ | '_ \ / __|  
"| (__| (_) || | | ||  _|| || (_| || |_| || |  | (_| || |_ | || (_) || | | |\__ \  
" \___|\___/ |_| |_||_|  |_| \__, | \__,_||_|   \__,_| \__||_| \___/ |_| |_||___/  
"                            |___/                                                                
" __               _    _                    _                _             
"/ _|  ___   _ __ | |_ | |__    ___   _ __  | | _   _   __ _ (_) _ __   ___ 
" |_  / _ \ | '__|| __|| '_ \  / _ \ | '_ \ | || | | | / _` || || '_ \ / __|
"  _|| (_) || |   | |_ | | | ||  __/ | |_) || || |_| || (_| || || | | |\__ \
"_|   \___/ |_|    \__||_| |_| \___| | .__/ |_| \__,_| \__, ||_||_| |_||___/
"                                    |_|               |___/ 



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
      \ 'colorscheme': 'gruvbox',
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

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }



" Community Gruvbox
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_termcolors=1



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
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1



" ALE

" keep the sign gutter open
let g:ale_sign_column_always = 1

" Change the signs in ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5



" Lightline-ale

" Register the components
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" Set color to the components
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

" VIM Gutter

" vim-gitgutter used to do this by default:
highlight! link SignColumn LineNr

" or you could do this:
" highlight SignColumn guibg=whatever ctermbg=whatever

let g:gitgutter_sign_allow_clobber = 1

" turn on line highlighting and line number highlighting by default
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

" .vim/after/plugin/gitgutter.vim
autocmd BufWritePost * GitGutter




" vim-simple-complete
set complete-=t
set complete-=i



" Indenting guidelines configuration for vim
let g:indent_guides_enable_on_vim_startup=1
let g:indentLine_setColors = 1

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 4 " (default: 2)

" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

" Change Indent Char
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Change Conceal Behaviour
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2


