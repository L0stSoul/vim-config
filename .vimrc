"--------------------------------------------------
" Bundles

" Turn off filetype plugins before bundles init
filetype off

" Setting up Vundle if not installed
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo 'Installing Vundle..'
    echo ''
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Add vundle to update it like any other bundle
Bundle 'gmarik/vundle'
" Some support functions used by delimitmate, and snipmate
Bundle 'vim-scripts/tlib'

" Add snippets functionality for vim
Bundle 'garbas/vim-snipmate'
" Dependency for snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'

" Default snippets. for snipmate
Bundle 'honza/vim-snippets'

" Colorscheme solarazied for vim
Bundle 'altercation/vim-colors-solarized'

" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it,
Bundle 'Raimondi/delimitMate'

" Add code static check on write
" need to be properly configured.
" I just enable it, with default config,
" many false positive but still usefull
Bundle 'scrooloose/syntastic'
" Install jshint for Syntastic
silent !type jshint &>/dev/null || { cd ~; echo 'Installing jshint'; npm install jshint; cd -; }

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
Bundle 'scrooloose/nerdtree'

" Provide smart autocomplete results for javascript, and some usefull commands
Bundle 'marijnh/tern_for_vim'
" install node dependencies for tern
if isdirectory(expand('~/.vim/bundle/tern_for_vim')) && !isdirectory(expand('~/.vim/bundle/tern_for_vim/node_modules'))
    !npm --prefix ~/.vim/bundle/tern_for_vim install
endif

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very usefull
Bundle 'tomtom/tcomment_vim'

" Best git wrapper for vim
" But with my workflow, i really rarely use it
" just Gdiff and Gblame sometimes
Bundle 'tpope/vim-fugitive'

" Fix-up dot command behavior
" it's kind of service plugin
Bundle 'tpope/vim-repeat'

" Add usefull hotkey for operation with surroundings
" cs{what}{towhat} - inside '' or [] or something like this allow
" change surroundings symbols to another
" and ds{what} - remove them
Bundle 'tpope/vim-surround'

" Add aditional hotkeys
Bundle 'tpope/vim-unimpaired'

" Smart search for anythig
Bundle 'vim-scripts/FuzzyFinder'
" Dependency for Fuzzy finder
Bundle 'vim-scripts/L9'

" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Bundle 'othree/html5.vim'

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
Bundle 'gregsexton/MatchTag'

" Add Support css3 property
Bundle 'hail2u/vim-css3-syntax'

" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
Bundle 'lukaszb/vim-web-indent'

" Plugin for changing cursor when entering in insert mode

" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after BundleInstall
Bundle 'jszakmeister/vim-togglecursor'

" Nice statusline/ruler for vim
Bundle 'bling/vim-airline'

" JShint :)
" But not necessary with syntastics
" Bundle 'walm/jshint.vim'

" Installing bundles for the first time
if iCanHazVundle == 0
    echo 'Installing Bundles, please ignore key map error messages'
    echo ''
    :BundleInstall
endif

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

"--------------------------------------------------
" Bundles settings

"-------------------------
" FuzzyFinder

" Exclude some files from suggest
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pyc|jpg|png|gif|svg)$|(^|[/\\])(\.(hg|git|bzr)|tmp)($|[/\\])'

" Find File
nnoremap <silent> <c-t> :FufFile **/<CR>

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

"-------------------------
" Fugitive

" Hotkeys for this guy
nmap <silent> <leader>b :.Gblame<cr>
vmap <silent> <leader>b :Gblame<cr>
nmap <silent> <leader>g :Gstatus<cr>
nmap <silent> <leader>w :Gwrite<cr>

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
nmap <silent> <leader>trf :TernRefs<CR>

" Find smart variable rename
nmap <silent> <leader>trn :TernRename<CR>

" Enable hints about function arguments
let g:tern_show_argument_hints=1

"-------------------------
" Solarized

" Without this solarized have dark background in my terminal
 let g:solarized_termtrans=1

" Setting up light color scheme
set background=light

" Use solarized colorscheme
colorscheme solarized

"-------------------------
" vim-airline

" Colorscheme for airline
let g:airline_theme='understated'

" Set custom left separator
let g:airline_left_sep = '▶'

" Set custom right separator
let g:airline_right_sep = '◀'


"--------------------------------------------------
" General options

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc secure

" Set up leader key <leader>, i use default \
"let mapleader = ','

" Buffer will be hidden instead of closed when no one display it
"set hidden

" Auto reload changed files
set autoread

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
highlight ColorColumn ctermbg=grey

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

" Folding according to syntax
set foldmethod=syntax

" No fold closed at open file
set foldlevel=99

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

    " Group end
    augroup END

endif
