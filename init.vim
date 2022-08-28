""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background colors
set background=dark
let g:colors_name="gruvbox"

" set the preferred color scheme
" colorscheme gruvbox

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
          let mapleader = "."

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
