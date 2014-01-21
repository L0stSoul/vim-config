"--------------------------------------------------
" NeoBundles

" Turn off filetype plugins before bundles init
filetype off
" Auto installing NeoNeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif




" Call NeoBundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))

" Determine make or gmake will be used for making additional deps for Bundles
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

" Let NeoNeoBundle manage NeoNeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Instlall vimrpoc. is uses by unite and neocomplcache
" for async searches and calls
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'unix': g:make
\    },
\ }

" Some support functions used by delimitmate, and snipmate
NeoBundle 'vim-scripts/tlib'

" Improve bookmarks in vim
" Allow word for bookmark marks, and nice quickfix window with bookmark list
NeoBundle 'AndrewRadev/simple_bookmarks.vim'

" plugin for fuzzy file search, most recent files list
" and much more
NeoBundle 'Shougo/unite.vim'

" Snippets engine with good integration with neocomplcache
NeoBundle 'Shougo/neosnippet'
" Default snippets for neosnippet, i prefer vim-snippets
"NeoBundle 'Shougo/neosnippet-snippets'
" Default snippets
NeoBundle 'honza/vim-snippets'

" Colorscheme solarazied for vim
NeoBundle 'altercation/vim-colors-solarized'

" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it,
NeoBundle 'Raimondi/delimitMate'

" Add code static check on write
" need to be properly configured.
" I just enable it, with default config,
" many false positive but still usefull
NeoBundle 'scrooloose/syntastic'
" Install jshint and csslint for syntastic
" Path to jshint if it not installed globally, then use local installation
if !executable("jshint")
    let g:syntastic_jshint_exec = '~/.vim/node_modules/.bin/jshint'
    "let g:syntastic_javascript_jshint_exec = '~/.vim/node_modules/.bin/jshint'
    if !executable(expand(g:syntastic_jshint_exec))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
endif
" Path to csslint if it not installed globally, then use local installation
if !executable("csslint")
    let g:syntastic_css_csslint_exec='~/.vim/node_modules/.bin/csslint'
    if !executable(expand(g:syntastic_css_csslint_exec))
        silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
    endif
endif

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
NeoBundle 'scrooloose/nerdtree'

" Provide smart autocomplete results for javascript, and some usefull commands
if has("python")
    NeoBundle 'marijnh/tern_for_vim'
    " install node dependencies for tern
    if isdirectory(expand('~/.vim/bundle/tern_for_vim')) && !isdirectory(expand('~/.vim/bundle/tern_for_vim/node_modules'))
        silent ! echo 'Installing tern' && npm --prefix ~/.vim/bundle/tern_for_vim install
    endif
endif

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very usefull
NeoBundle 'tomtom/tcomment_vim'

" Best git wrapper for vim
" But with my workflow, i really rarely use it
" just Gdiff and Gblame sometimes
NeoBundle 'tpope/vim-fugitive'

" Fix-up dot command behavior
" it's kind of service plugin
NeoBundle 'tpope/vim-repeat'

" Add usefull hotkey for operation with surroundings
" cs{what}{towhat} - inside '' or [] or something like this allow
" change surroundings symbols to another
" and ds{what} - remove them
NeoBundle 'tpope/vim-surround'

" Add aditional hotkeys
" Looks like i'm not using it at all
"NeoBundle 'tpope/vim-unimpaired'

" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
NeoBundle 'othree/html5.vim'

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
NeoBundle 'gregsexton/MatchTag'

" Add Support css3 property
NeoBundle 'hail2u/vim-css3-syntax'

" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
NeoBundle 'lukaszb/vim-web-indent'

" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after NeoBundleInstall
NeoBundle 'jszakmeister/vim-togglecursor'

" Nice statusline/ruler for vim
NeoBundle 'bling/vim-airline'

" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
NeoBundle 'jelera/vim-javascript-syntax'


" Code complete
NeoBundle 'Shougo/neocomplcache.vim'

" JShint :)
" But not necessary with syntastics
" NeoBundle 'walm/jshint.vim'

" Installing bundles for the first time
if iCanHazNeoBundle == 0
    echo 'Installing Bundles, please ignore key map error messages'
    :NeoBundleInstall
endif

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------------------------------------
" Bundles settings

"-------------------------
" Unite

" Set unite window height
let g:unite_winheight = 10

" Start unite in insert mode by default
let g:unite_enable_start_insert = 1

" Display unite on the bottom (or bottom right) part of the screen
let g:unite_split_rule = 'botright'

" Set short limit for max most recent files count.
" It less unrelative recent files this way
let g:unite_source_file_mru_limit = 30

let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" Hotkey for open window with most recent files
nnoremap <silent><leader>m :<C-u>Unite file_mru <CR>

" Enable history for yanks
let g:unite_source_history_yank_enable = 1

" Make samll limit for yank history, to use it like multiple buffers
let g:unite_source_history_yank_limit = 20

" Hotkey for open history window
nnoremap <silent><leader>h :Unite -quick-match -auto-quit history/yank<CR>

" Quick tab navigation
nnoremap <silent><leader>' :Unite -quick-match -auto-quit tab<CR>

" Fuzzy find files
nnoremap <silent><leader>' :Unite file_rec/async -start-insert<CR>

" Unite-grep
nnoremap <silent><leader>/ :Unite grep:. -start-insert -silent -wrap<CR>

" If ack exists use it instead of grep
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" Unite settings for autocmd
function! s:unite_settings()
    " Close Unite on <ESC>
    nmap <buffer> <ESC> <Plug>(unite_all_exit)
endfunction

"-------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let NERDTreeShowHidden=1

" Display current file in the NERDTree ont the left
nmap <silent> <leader>f :NERDTreeFind<CR>

"-------------------------
" Syntastic

" Enable autochecks
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" open quicfix window with all error found
nmap <silent> <leader>ll :lopen<cr>
" previous syntastic error
nmap <silent> [ :lprev<cr>
" next syntastic error
nmap <silent> ] :lnext<cr>

"-------------------------
" Fugitive

" Hotkeys for this guy
nmap <silent> <leader>b :.Gblame<cr>
vmap <silent> <leader>b :Gblame<cr>
nmap <silent> <leader>g :Gstatus<cr>
nmap <silent> <leader>w :Gwrite<cr>

"-------------------------
" simple_bookmark

" set custom path for bookmark file
let g:simple_bookmarks_filename = '~/.vim/.vim_bookmarks'

" hotkey for open Bookmark list
nmap <silent> <leader>ml :CopenBookmarks<CR>

" override default bookmarks with ours
nmap m :Bookmark<Space>
nmap ' :GotoBookmark<Space>

"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

"-------------------------
" Tern_for_vim

" Go to definition
nmap <silent> <leader>td :TernDef<CR>

" Find all refs for variable under cursor
nmap <silent> <leader>tr :TernRefs<CR>

" Find smart variable rename
nmap <silent> <leader>tn :TernRename<CR>

"-------------------------
" Solarized

" Without this solarized have dark background in my terminal
 let g:solarized_termtrans=1

" Setting up light color scheme
set background=light

" Use solarized colorscheme
colorscheme solarized

"-------------------------
" neosnippets
"

" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Disables standart snippets. We use vim-snippets bundle instead
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" Expand snippet and jimp to next snippet field on Enter key.
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

"-------------------------
" vim-airline

" Colorscheme for airline
let g:airline_theme='understated'

" Set custom left separator
let g:airline_left_sep = '▶'

" Set custom right separator
let g:airline_right_sep = '◀'

" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1

" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0

" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't display encoding
let g:airline_section_y = ''

" Don't display filetype
let g:airline_section_x = ''

"-------------------------
" neocomplcache

" Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1

" Max items in code-complete
let g:neocomplcache_max_list = 10

" Max width of code-complete window
let g:neocomplcache_max_keyword_width = 80

" Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1

" Auto select first item in code-complete
let g:neocomplcache_enable_auto_select = 1

" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1

" Smart tab Behavior
function! CleverTab()
    " If autocomplete window visible then select next item in there
    if pumvisible()
        return "\<C-n>"
    endif
    " If it's begining of the string then return just tab pressed
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " If not begining of the string, and autocomplete popup is not visible
        " Open this popup
        return "\<C-x>\<C-u>"
    endif
endfunction
inoremap <expr><TAB> CleverTab()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" For cursor moving in insert mode
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" disable preview in code complete
set completeopt-=preview

"--------------------------------------------------
" General options

" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc secure

" Set up leader key <leader>, i use default \
"let mapleader = ','

" Buffer will be hidden instead of closed when no one display it
"set hidden

" Auto reload changed files
set autoread

" Always change current dirrectory to current-editing-file dir
set autochdir

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" Use 256 colors in vim
" vim-airline not work without it
set t_Co=256

" Enable Tcl interface. Not shure what is exactly mean.
" set infercase

" Interprete all files like binary and disable many features.
" set binary

"--------------------------------------------------
" Display options

" Hide showmode
" Showmode is useless with airline
set noshowmode

" Show file name in window title
set title

" Mute error bell
set novisualbell

" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
set shortmess=atI

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
" Useless with nowrap
" set linebreak

" Numbers of line to scroll when the cursor get off the screen
" Useless with scrolloff
" set scrolljump=5

" Numbers of columns to scroll when the cursor get off the screen
" Useless with sidescrollof
" set sidescroll=4

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" Vim will move to the previous/next line after reaching first/last char in
" the line with this commnad (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

" Display command which you typing and other command related stuff
set showcmd

" Indicate that last window have a statusline too
set laststatus=2

" Add a line / column display in the bottom right-hand section of the screen.
" Not needed with airline plugin
"set ruler

" Setting up right-hand section(ruller) format
" Not needed with airline plugin
"set rulerformat=%30(%=\:%y%m%r%w\ %l,%c%V\ %P%)

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Disable wrapping long string
set nowrap

" Display Line numbers
set number

" Highlight line with cursor
set cursorline

" maximum text length at 80 symbols, vim automatically breaks longer lines
set textwidth=80

" higlight column right after max textwidth
set colorcolumn=+1

" set highlighting for columns in colorcolumn
highlight ColorColumn ctermbg=lightGrey

"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. it add additional indents whe necessary
set smartindent

" Replace tabs with spaces
set expandtab

" Whe you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" number of spaces to use for each step of indent
set shiftwidth=4

" Number of spaces that a Tab in the file counts for
set tabstop=4

" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=4

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround

"--------------------------------------------------
" Search options

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>


"--------------------------------------------------
" Wildmenu

" Extended autocmpletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"--------------------------------------------------
" Folding

" Enable syntax folding in javascript
let javaScript_fold=1

" No fold closed at open file
set foldlevelstart=99

" Keymap to toggle folds with space
nmap <space> za

"--------------------------------------------------
" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode on \p
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Disable backups file
set nobackup

" Disable vim common sequense for saving.
" By defalut vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

"--------------------------------------------------
" Diff Options

" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=horizontal

" Ignore changes in whitespaces characters
set diffopt+=iwhite

"--------------------------------------------------
" Aautocmd

" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previosly defined autocommands
    au!
        " Auto reload vim after your cahange it
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufRead,BufNewFile *.js set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=javascript
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.json set equalprg=python\ -mjson.tool
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " Disable vertical line at max string length in NERDTree
        autocmd FileType * setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Enable Folding, uses plugin vim-javascript-syntax
        au FileType javascript* call JavaScriptFold()

        " Special setting for Unite buffer
        autocmd FileType unite call s:unite_settings()

    " Group end
    augroup END

endif
