"  /$$      /$$                            /$$                                                                        /$$$$$$  /$$          
" | $$$    /$$$                           |__/                                                                       /$$__  $$|__/          
" | $$$$  /$$$$ /$$   /$$       /$$    /$$ /$$ /$$$$$$/$$$$   /$$$$$$   /$$$$$$$        /$$$$$$$  /$$$$$$  /$$$$$$$ | $$  \__/ /$$  /$$$$$$ 
" | $$ $$/$$ $$| $$  | $$      |  $$  /$$/| $$| $$_  $$_  $$ /$$__  $$ /$$_____/       /$$_____/ /$$__  $$| $$__  $$| $$$$    | $$ /$$__  $$
" | $$  $$$| $$| $$  | $$       \  $$/$$/ | $$| $$ \ $$ \ $$| $$  \__/| $$            | $$      | $$  \ $$| $$  \ $$| $$_/    | $$| $$  \ $$
" | $$\  $ | $$| $$  | $$        \  $$$/  | $$| $$ | $$ | $$| $$      | $$            | $$      | $$  | $$| $$  | $$| $$      | $$| $$  | $$
" | $$ \/  | $$|  $$$$$$$         \  $/   | $$| $$ | $$ | $$| $$      |  $$$$$$$      |  $$$$$$$|  $$$$$$/| $$  | $$| $$      | $$|  $$$$$$$
" |__/     |__/ \____  $$          \_/    |__/|__/ |__/ |__/|__/       \_______/       \_______/ \______/ |__/  |__/|__/      |__/ \____  $$
"               /$$  | $$                                                                                                          /$$  \ $$
"              |  $$$$$$/                                                                                                         |  $$$$$$/
"               \______/                                                                                                           \______/ 


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background colors
set background=dark
let g:colors_name="gruvbox"

" set the preferred color scheme
colorscheme gruvbox

" Filetype detection
filetype indent on
filetype plugin on

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Enable use of the mouse for all modes
if has('mouse')
      set mouse=a
  endif

" Set GUI colors in the terminal
set tgc

" Setting up the guicursor
set guicursor=

" efficient scolling
set lazyredraw

" Rendering
set ttyfast

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Don't exit the buffer when editing a text file
set hidden

" For regular expressions turn magic on
set magic

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""
" status lines in vim/neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shows the Tablines
set showtabline=4

" NOTE: Use this setting if you are lacking dependecies and need a custom
" statusline for your workflow
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Show the commends
set showcmd

" specifies how command line completion works
set wim=full

" Display height for command window
set cmdheight=2

" autocomplete commands for you
set wildmenu


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nubers and signcolumns
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set number
set nu

" Set relative number
set relativenumber

" Setting up the basic sign column
set signcolumn=yes

" Highlight the vertical column to 80
set colorcolumn=80

" NOTE: Setting these options may slow your cpu performance while editing
" text

" Vertical column
set nocursorcolumn

" Horizontal column
set nocursorline

" Highlighting similar brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" Add a bit extra margin to the left
set foldcolumn=2


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
" incremental search
set incsearch

" ignorecase
set ignorecase

" No highlight search
set nohlsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""
" text formatting 
""""""""""""""""""""""""""""""""""""""""""""""""""""

" disabling wrap
set nowrap

" Set the scrolloff to 8
set scrolloff=8


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indents, tabstop, and indenting guidlines
""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set autowrite

" display indentation guides
set list listchars=tab:┃ ,trail:·,extends:⇉,precedes:⇇,nbsp:×

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

" NOTE: Use this if you don't prefer the current settings
" Higlights the tabs
" match Search /\%(\_^\s*\)\@<=\%(\%1v\|\%5v\|\%9v\)\s/


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Keymappings
""""""""""""""""""""""""""""""""""""""""""""""""""""
" ISSUE_1: Keymappings are not in desired settings
" ISSUE_2: Netwr setting could easily interfere the current setting at the
" moment
" ISSUE_3: Leader key setting not efficient in any way or another

" Pick a leader key
let mapleader = " "

" quicker window switching
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" quicker window resize
nnoremap <C-h> <C-w>>
nnoremap <C-k> <C-w>-
nnoremap <C-j> <C-w>+
nnoremap <C-l> <C-w><

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Copy and pasting in Vim to other programs
vnoremap <C-c> "+y
map <C-p> "+P
" For copying to both the clipboard and primary selection
vnoremap <C-c> "*y :let @+=@*<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding text
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Code folding
set foldenable
set foldlevelstart=10
nnoremap \  za
set foldmethod=indent


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages and words
""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: This command is not accurate and if you need percise word counnter,
" Try search for other solution in the web
" Word counter
map <F3> :w !detex \| wc -w<CR>

" lamguage settings
let $LANG='en'
set langmenu=en

" Check spelling errors
set spell


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""

" New tabs
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-c> :tabclose<CR>

" Shortcut for switching to different tabs
nnoremap <A-p> <C-PageDown>
nnoremap <A-l> <C-PageUp>
 
" Switching to different hidden buffers
nnoremap <A-[> :snext<CR> 


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto completion in vim
""""""""""""""""""""""""""""""""""""""""""""""""""""

set complete+=kspell
set shortmess+=c

inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" :"<Up>"

inoremap <expr> <Down> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

inoremap <expr> <Left> pumvisible() ? "<C-e>" :"<Left>"



"  /$$    /$$ /$$                       /$$$$$$$  /$$                     /$$                               /$$$$$$$ 
" | $$   | $$|__/                      | $$__  $$| $$                    |__/                              | $$__  $$
" | $$   | $$ /$$ /$$$$$$/$$$$         | $$  \ $$| $$ /$$   /$$  /$$$$$$  /$$ /$$$$$$$   /$$$$$$$       /$$| $$  \ $$
" |  $$ / $$/| $$| $$_  $$_  $$ /$$$$$$| $$$$$$$/| $$| $$  | $$ /$$__  $$| $$| $$__  $$ /$$_____/      |__/| $$  | $$
"  \  $$ $$/ | $$| $$ \ $$ \ $$|______/| $$____/ | $$| $$  | $$| $$  \ $$| $$| $$  \ $$|  $$$$$$           | $$  | $$
"   \  $$$/  | $$| $$ | $$ | $$        | $$      | $$| $$  | $$| $$  | $$| $$| $$  | $$ \____  $$       /$$| $$  | $$
"    \  $/   | $$| $$ | $$ | $$        | $$      | $$|  $$$$$$/|  $$$$$$$| $$| $$  | $$ /$$$$$$$/      |__/| $$$$$$$/
"     \_/    |__/|__/ |__/ |__/        |__/      |__/ \______/  \____  $$|__/|__/  |__/|_______/           |_______/ 
"                                                               /$$  \ $$                                            
"                                                              |  $$$$$$/                                            
"                                                               \______/                                             

" Initialize plugin system
call plug#begin('~/.vim/plugged')

    " rgb, hex, hsl, etc. color preview in vim
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    " Community Gruvbox
    Plug 'gruvbox-community/gruvbox'

    " Add a nice bling to vim
    Plug 'vim-airline/vim-airline'

    " Auto completion for neovim
    Plug 'ycm-core/YouCompleteMe'

    " File explorer for neovim
    Plug 'preservim/nerdtree'
    
    " Replacing the default startup of neovim
    Plug 'mhinz/vim-startify'

    " Syntax checking and semantic errors 
    Plug 'dense-analysis/ale'

call plug#end()

"___  _    _  _ _  _ ____ _ _  _    ____ ____ ___ ___ _ _  _ ____ . ____
"|__] |    |  | |\ | | __ | |\ |    [__  |___  |   |  | |\ | | __ ' [__
"|    |___ |__| | \| |__] | | \|    ___] |___  |   |  | | \| |__]   ___]

":::::::::::::::::::::::::::::::::::::::::::::::::::
": vim-airline
":::::::::::::::::::::::::::::::::::::::::::::::::::

" Enable extension for airline
let g:airline#extensions#tabline#enabled = 1

" Configure your own seperator 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Setup your own path formatter to your liking
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'



":::::::::::::::::::::::::::::::::::::::::::::::::::
": NERDtree
":::::::::::::::::::::::::::::::::::::::::::::::::::

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <A-n> :NERDTree<CR>
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <A-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif



":::::::::::::::::::::::::::::::::::::::::::::::::::
": Startify
":::::::::::::::::::::::::::::::::::::::::::::::::::

" Custom Header for startify

let g:ascii = [
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ ]

    let g:startify_custom_header = g:ascii + startify#fortune#boxed()

" Custom Footer for startify

let g:startify_custom_footer = [
            \'============================================================',
            \ ]



":::::::::::::::::::::::::::::::::::::::::::::::::::
": ALE (Asynchronous Lint Engine)
":::::::::::::::::::::::::::::::::::::::::::::::::::

" Keep the sign gutter open
let g:ale_sign_column_always = 1

" ALE signs
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🟡'

" Highlight colors for displaying syntax errors in a line
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" floating border preview window
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

" Set this in your vimrc file to enabling highlighting
let g:ale_set_highlights = 1

" Keeps the error list open
let g:ale_keep_list_window_open = 1

