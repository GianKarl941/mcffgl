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

" ___  ____ ____ _ ____    ____ ____ ___ ___ _ _  _ ____ ____ 
" |__] |__| [__  | |       [__  |___  |   |  | |\ | | __ [__  
" |__] |  | ___] | |___    ___] |___  |   |  | | \| |__] ___] 

" Set background color
set background=dark
let g:colors_name="gruvbox"

" Filetype detection
filetype indent on
filetype plugin on

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,longest,preview

"" MARK

" setup a filetype dictionary for every filetype
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType cpp set omnifunc=omni#cpp#complete#Main

" Enable use of the mouse for all modes
if has('mouse')
      set mouse=a
  endif

" Set GUI colors for the terminal
set tgc 

" Setting up the guicursor
set guicursor=

" efficient scolling
set lazyredraw

" Rendering
set ttyfast

" Don't exit the buffer when editing a text file
set hidden

" For regular expressions turn magic on
set magic

if !has('gui_running')
  set t_Co=256
endif

" #################
" #filetye options#
" #################

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" for html
"set filetype=html

" for css 
"set filetype=css

" for C++
"set filetype=cpp

" ###########################
" #setting up the statusline#
" ###########################

" Shows the Tableines
set showtabline=4

" Format the status line
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Show the commends
set showcmd

" specifies how command line completion works
set wim=full

" Display height for command window
set cmdheight=1

" autocomplete commands for you
set wildmenu

" ##########################
" #Numbering and signcolumn#
" ##########################

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

" Veriical column
set nocursorcolumn

" Horizontal column
set nocursorline

" Highlighting similar brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" #################
" #Search settings#
" #################

" incremental search
set incsearch

" ignorecase
set ignorecase

" No highlight search
set nohlsearch

" #################
" #Text formatting#
" #################

" disabling wrap
set nowrap

" Set the scrolloff to 8
set scrolloff=8

" Setting up omnifunc
set omnifunc=1

set completefunc=1

set omnifunc=syntaxcomplete#Complete

" for html
"set omnifunc=htmlcomplete#CompletTags

" for css 
"set omnifunc=csscomplete#CompleteCSS 

" for C++
"set omnifunc=omni#cpp#complete#Main

" ############################################
" #Indents, tabstop, and indenting guidelines#
" ############################################

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

" Higlights the tabs
" match Search /\%(\_^\s*\)\@<=\%(\%1v\|\%5v\|\%9v\)\s/

" ###################
" #Basic keymappings#
" ###################

" Pick a leader key
let mapleader = ","

" quicker window switching
nnoremap <Leader>h <C-w>h 
nnoremap <Leader>j <C-w>j 
nnoremap <Leader>k <C-w>k 
nnoremap <Leader>l <C-w>l 

" quicker window resize 
nnoremap <S-h> <C-w>< 
nnoremap <S-k> <C-w>- 
nnoremap <S-j> <C-w>+ 
nnoremap <S-l> <C-w>>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Copy and pasting in Vim to other programs
vnoremap <C-c> "+y
map <C-p> "+P
" For copying to both the clipboard and primary selection
vnoremap <C-c> "*y :let @+=@*<CR>

" ##############
" #Code folding#
" ##############

" Code folding 
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent

" ####################
" #Language and words#
" ####################

" Word counter
map <F3> :w !detex \| wc -w<CR>

" lamguage
let $LANG='en' 
set langmenu=en

set spell

" ##################
" #Tab files in vim#
" ##################

" New tab
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <silent> <C-c> :tabclose<CR>

" Shortcut for switching to different tabs
nnoremap <S-m> <C-PageDown>
nnoremap <S-p> <C-PageUp>

" ####################
" #splitting a window#
" ####################

" for 16:9 aspect ratio
set splitbelow splitright

" #########################
" #auto completions in vim#
" #########################

set complete+=kspell
set shortmess+=c

inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" :"<Up>"

inoremap <expr> <Down> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

inoremap <expr> <Left> pumvisible() ? "<C-e>" :"<Left>"


" ################
" #Netrw settings#
" ################

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 30
let g:netrw_altv = 1

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'

nnoremap <leader>t :Lexplore %:p:h<CR>
nnoremap <Leader>T :Lexplore<CR>

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

" rgb, hex, hsl, etc. color preview in vim
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Community Gruvbox
Plug 'gruvbox-community/gruvbox'

" Centering the text in vim
Plug 'junegunn/goyo.vim'

" Bhow the indenting lines in vim
Plug 'nathanaelkane/vim-indent-guides'

" Asynchronous Lint Engine for vim
Plug 'dense-analysis/ale'

" Automatically show vim's built-in autocomplete
Plug 'vim-scripts/AutoComplPop'

" It basically shows the git diff of every lines that you have edited
Plug 'airblade/vim-gitgutter'

" Add a nice bling to vim
Plug 'vim-airline/vim-airline'

" dependecies tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" Startup menu for vim
Plug 'mhinz/vim-startify'

" Clang completion in vim
Plug 'xavierd/clang_complete'

call plug#end()

"___  _    _  _ _  _ ____ _ _  _    ____ ____ ___ ___ _ _  _ ____ . ____ 
"|__] |    |  | |\ | | __ | |\ |    [__  |___  |   |  | |\ | | __ ' [__  
"|    |___ |__| | \| |__] | | \|    ___] |___  |   |  | | \| |__]   ___] 
"                                                                        


" vim-airline
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'



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



" Community Gruvbox
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_termcolors=1






" Configuration for goyo

nnoremap <C-b> :Goyo x58 <CR>
nnoremap <S-b> :Goyo! <CR>



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
let g:ale_sign_error = '🚫'
let g:ale_sign_warning = '⚠️'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5



" VIM Gutter

" vim-gitgutter used to do this by default:
" highlight! link SignColumn LineNr

" or you could do this:
" highlight SignColumn guibg=whatever ctermbg=whatever

" turn on line highlighting and line number highlighting by default
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0

" .vim/after/plugin/gitgutter.vim
 autocmd BufWritePost * GitGutter

let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = '✚'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}





" rgb, hex, hsl, etc. color preview in vim

" :HexokinaseTurnOn

nnoremap <S-u> :HexokinaseToggle <CR>

" All possible highlighters
let g:Hexokinase_highlighters = [
\   'backgroundfull',
\ ]

" Patterns to match for all filetypes
" Can be a comma separated string or a list of strings
" Default value:
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" All possible values
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" Filetype specific patterns to match
" entry value must be comma seperated list
let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
\ }



" indentLines in vim

" let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3c3836 ctermbg=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#282828 ctermbg=2

" Clang stuff

 " path to directory where library can be found
 let g:clang_library_path='/usr/lib/llvm-3.8/lib'
 " or path directly to the library file
 let g:clang_library_path='/usr/lib64/libclang.so.3.8'

 let g:clang_library_path='/usr/lib/llvm3.5/lib/libclang.so.1'



