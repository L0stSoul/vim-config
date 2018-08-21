"--------------------------------------------------
" NeoBundle Init

" Use 256 colors in vim
" some plugins not work without it
set t_Co=256

" Turn off filetype plugins before bundles init
filetype off
" Auto installing NeoNeoBundle
let isNpmInstalled = executable("npm")
" Default path for node-modules
let s:defaultNodeModules = '~/.vim/node_modules/.bin/'
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    if !isNpmInstalled
        echo "==============================================="
        echo "Your need to install npm to enable all features"
        echo "==============================================="
    endif
    echo "Installing NeoBundle.."
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" Determine make or gmake will be used for making additional deps for Bundles
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

"--------------------------------------------------
" Bundles

" Let NeoNeoBundle manage NeoNeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Install vimrpoc. is uses by unite and neocomplcache
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
" NeoBundle 'AndrewRadev/simple_bookmarks.vim'

" Plugin for fuzzy file search, most recent files list
" and much more
NeoBundle 'Shougo/unite.vim'

" Snippet engine
NeoBundle 'SirVer/ultisnips'

" Default snippets
NeoBundle 'honza/vim-snippets'

" Dirr diff
NeoBundle 'vim-scripts/DirDiff.vim'

" Colorscheme solarazied for vim
NeoBundle 'altercation/vim-colors-solarized'

" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it,
NeoBundle 'Raimondi/delimitMate'

" Add code static check on write
" need to be properly configured.
" I just enable it, with default config,
" many false positive but still useful
NeoBundle 'scrooloose/syntastic'
" Install jshint and stylelint for syntastic
" Path to jshint if it not installed, then use local installation
if isNpmInstalled
    if !executable(expand(s:defaultNodeModules . 'jshint'))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
    if !executable(expand(s:defaultNodeModules . 'tslint'))
        silent ! echo 'Installing tslint' && npm --prefix ~/.vim/ install tslint
    endif
    if !executable(expand(s:defaultNodeModules . 'stylelint'))
        silent ! echo 'Installing stylelint' && npm --prefix ~/.vim/ install stylelint
    endif
endif

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
NeoBundle 'scrooloose/nerdtree'

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very useful
NeoBundle 'tomtom/tcomment_vim'

" Show code coverage in vim
NeoBundle 'L0stsoul/coverage.vim'

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

" Improve javascript syntax higlighting, needed for good folding,
" and good-looking javascript code
NeoBundle 'jelera/vim-javascript-syntax'

" Improved json syntax highlighting
NeoBundle 'elzr/vim-json'

" Syntax highlighting for .jsx (js files for react js)
NeoBundle 'mxw/vim-jsx'

" Syntax highlighting for typescript
NeoBundle 'leafgarland/typescript-vim'

" Add Support css3 property
NeoBundle 'hail2u/vim-css3-syntax'

" Syntax highlighting for mustache & handlebars
NeoBundle 'mustache/vim-mustache-handlebars'

" Syntax highlighting for Stylus
NeoBundle 'wavded/vim-stylus'

" Add support for taltoad/vim-jadeumarkdown
NeoBundle 'tpope/vim-markdown'

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
NeoBundle 'gregsexton/MatchTag'

" Automatically add closing tags in html-like formats
NeoBundle 'alvan/vim-closetag'

" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
NeoBundle 'lukaszb/vim-web-indent'

" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after NeoBundleInstall
NeoBundle 'jszakmeister/vim-togglecursor'

" Nice statusline/ruler for vim
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Code-completion for jquery, lodash e.t.c
NeoBundle 'othree/javascript-libraries-syntax.vim'

" Most recent files source for unite
NeoBundle 'Shougo/neomru.vim'

" Autocompletion engine
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build' : {
     \     'unix' : './install.sh --js-completer && git submodule update --init --recursive',
     \     'windows' : './install.sh --js-completer && git submodule update --init --recursive',
     \     'cygwin' : './install.sh  --js-completer && git submodule update --init --recursive'
     \    }
     \ }
" uses globally installed typescript for compeltion
if isNpmInstalled && !executable('tsc')
    silent ! echo 'Installing typescript' && npm install -g typescript
endif

" Yank history for unite
NeoBundle 'Shougo/neoyank.vim'

" Plugin for chord mappings
NeoBundle 'kana/vim-arpeggio'

" JShint :)
" But not necessary with syntastics
" NeoBundle 'walm/jshint.vim'

call neobundle#end()

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

" Disable annoying prompt on initial bundle install
set nomore

" Fix issue when github refuse connections on initial install
let g:neobundle#install_max_processes=2

" Fix issue for long builds during initial install
let g:neobundle#install_process_timeout=180

" Install all bundles on first launch
if !iCanHazNeoBundle
    NeoBundleInstall
endif

" Check new bundles on startup
NeoBundleCheck

"--------------------------------------------------
" Bundles settings

"-------------------------
" ultsnips

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0

" Smart snippet expanding on CR
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

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
let g:unite_source_file_mru_limit = 100

" Enable history for yanks
let g:unite_source_history_yank_enable = 1

" Make small limit for yank history,
let g:unite_source_history_yank_limit = 40

" Grep options Default for unite + supress error messages
let g:unite_source_grep_default_opts = '-iRHns'

let g:unite_source_rec_max_cache_files = 99999

" If ack exists use it instead of grep
if executable('ack-grep')
    " Use ack-grep
    let g:unite_source_grep_command = 'ack-grep'
    " Set up ack options
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" Hotkey for open window with most recent files
nnoremap <silent><leader>m :<C-u>Unite file_mru <CR>

" Hotkey for open history window
nnoremap <silent><leader>h :Unite -quick-match -max-multi-lines=2 -start-insert history/yank<CR>

" Quick tab navigation
nnoremap <silent><leader>' :Unite tab<CR>

"-------------------------
" coverage
"
let g:coverage_json_report_pathes = ['.coverage/coverage-final.json', 'coverage/coverage-final.json']
let g:coverage_sign_covered = '⦿'
let g:coverage_show_covered = 1

"-------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let NERDTreeShowHidden=1

" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1

" Display current file in the NERDTree ont the left
nmap <silent> <leader>f :NERDTreeFind<CR>

"-------------------------
" Syntastic

function! s:FindSyntasticExecPath(toolName)
    if executable(a:toolName)
        return a:toolName
    endif

    let fullPath=fnamemodify('.', ':p:h')
    while fullPath != fnamemodify('/', ':p:h')
        if filereadable(expand(fullPath . '/node_modules/.bin/' . a:toolName))
            return fullPath . '/node_modules/.bin/' . a:toolName
        endif
        let fullPath = fnamemodify(fullPath . '/../', ':p:h')
    endwhile

    return  s:defaultNodeModules . a:toolName

endfunction

" setting up jshint, tslint, stylelint and jscs if available
let g:syntastic_javascript_jshint_exec = s:FindSyntasticExecPath('jshint')
let g:syntastic_javascript_jscs_exec = s:FindSyntasticExecPath('jscs')
let g:syntastic_typescript_tslint_exec = s:FindSyntasticExecPath('tslint')
let g:syntastic_css_stylelint_exec = s:FindSyntasticExecPath('stylelint')

" Enable autochecks
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" For correct works of next/previous error navigation
let g:syntastic_always_populate_loc_list = 1

" check json files with jshint
let g:syntastic_filetype_map = { "json": "javascript", }

let g:syntastic_javascript_checkers = ["jshint", "jscs"]
let g:syntastic_typescript_checkers = ["tslint"]
let g:syntastic_css_checkers = ["stylelint"]

" open quicfix window with all error found
nmap <silent> <leader>ll :lopen<cr>
" previous syntastic error
nmap <silent> [ :lprev<cr>
" next syntastic error
nmap <silent> ] :lnext<cr>

"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>b :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>b :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>


"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

" Without this we can't disable delimitMate for specific file types
let loaded_delimitMate = 1

"-------------------------
" vim-mustache-handlebars

" Enable shortcuts for things like {{{ an {{
let g:mustache_abbreviations = 1

"-------------------------
" vim-closetag

" Enable for files with this extensions
let g:closetag_filenames = "*.handlebars,*.html,*.xhtml,*.phtml"

"-------------------------
" Solarized

" If You have problem with background, uncomment this line
" let g:solarized_termtrans=1

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
" YouCompleteMe

let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \   'less': [ 're!^\s{4}', 're!:\s+' ],
    \ }

" Choose completion with tab
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

" Populate location list with errors to behave just like syntastic
let g:ycm_always_populate_location_list = 1

" Go to type definition/declaration
nmap <silent> <leader>td :YcmCompleter GoTo<CR>

" Show all references to variable under coursor
nmap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

" Show type of variable under cursor
nmap <silent> <leader>gt :YcmCompleter GetType<CR>

" Show docs for entity under cursor
nmap <silent> <leader>gd :YcmCompleter GetDoc<CR>

" Refactor smart rename, space at the end are important :)
nmap <leader>rr :YcmCompleter RefactorRename 

"-------------------------
" Arpeggio

" Map jk to escape
call arpeggio#map('i', '', 0, 'jk', '<ESC>')

"--------------------------------------------------
" Colorscheme

" Use solarized colorscheme
colorscheme solarized

" Setting up light color scheme
set background=light

" Set highlighting for colorcolumn
highlight ColorColumn ctermbg=lightGrey

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

" Always change current directory to current-editing-file dir
"set autochdir

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

" Enable Tcl interface. Not sure what is exactly mean.
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

" open preview window at bottom
set splitbelow

" Hide preview window for completion
set completeopt-=preview

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

" Numbers of lines to scroll when the cursor get off the screen
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
" the line with this command (you can add 'h' or 'l' here as well)
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

" Maximum text length at 80 symbols, vim automatically breaks longer lines
" set textwidth=80

" Highlight column right after max textwidth
set colorcolumn=+1


"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. It add additional indents whe necessary
set smartindent

" Replace tabs with spaces
set expandtab

" When you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" Number of spaces to use for each step of indent
set shiftwidth=4

" Number of spaces that a Tab in the file counts for
set tabstop=4

" Same but for editing operation (not sure what exactly does it means)
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

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable highlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>


"--------------------------------------------------
" Wildmenu

" Extended autocompletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"--------------------------------------------------
" Folding

" Enable syntax folding in javascript
let javaScript_fold=1

" No fold closed at open file
set foldlevelstart=99
set nofoldenable

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

" Disable vim common sequence for saving.
" By default vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

" Spellcheck
set spell spelllang=en_us

"--------------------------------------------------
" Diff Options

" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=horizontal

" Ignore changes in whitespaces characters
set diffopt+=iwhite

"--------------------------------------------------
" Hotkeys

" Open new tab
nmap <silent><leader>to :tabnew .<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Moving between splits
nmap <leader>w <C-w>w

"--------------------------------------------------
" Autocmd

" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previously defined autocommands
    au!
        " Auto reload vim after your change it
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
        au BufRead,BufNewFile *.js set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=json
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.bemtree set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType typescript setlocal omnifunc=typescriptcomlete#CompleteTS

        " Disable vertical line at max string length in NERDTree
        autocmd FileType * setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Not enable Folding - it really slow on large files, uses plugin vim-javascript-syntax
        " au FileType javascript* call JavaScriptFold()
        au FileType html let b:loaded_delimitMate = 1
        au FileType handlebars let b:loaded_delimitMate = 1

    " Group end
    augroup END

endif
