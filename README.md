### Vim config for web development

<img src="http://i.imgur.com/ElOEHZ3.png"/>

### Features
* Only one file, you don't need to run any installation script.
* Integration with Git.
* Integration with grep/ack.
* Automatic syntax and codestyle checks.
* Smart autocomplete.
* Tweeks for easier navigation.
* Snippets.
* Fully documented.
* Optimized for web development.
* Quick Tab navigation, recent files list, fuzzy search, and other (see the full list of features).

### Hotkeys
In Vim there is the `leader` key, which is by default `\` , but you can change it in any
time.

Action | Hotkey
--------------------------------------------------------- | -----------------
**▶ File operations**                                     |
Recent Files List                                         | `leader m`
FuzzyFinder fo files                                      | `leader ;`
Ack/Grep                                                  | `leader /`
Show current file in NERDtree in a split                  | `leader f`
**▶ JShint/CSSlint navigation**                           |
Show error window                                         | `leader ll`
Go to the next line with error/warning                    | `]`
Go to the previous line with error/warning                | `[`
**▶ Advanced Javascript features (if Tern is available)** |
Find all refs for the variable under cursor               | `leader tr`
Smart rename a variable and all references to it          | `leader tn`
**▶ Code completion**                                     |
Start autocompletion                                      | `tab`
Undo autocompletion                                       | `ctrl+e`
Expand snippet                                            | `Enter`
**▶ Integration with Git**                                |
Git blame on the current line or all selected line        | `leader b`
Git status                                                | `leader gst`
Git add/checkout file                                     | `leader gw`
Git diff                                                  | `leader gd`
Git commit                                                | `leader gc`
Git commit all                                            | `leader gca`
Git commit -a --amend                                     | `leader gcf`
**▶ Other**                                               |
Toggle comment on the current line                        | `gcc`
Toggle comments                                           | `gc in visual mode, or gc + motion`
Change surrounding symbols (like [ or ")                  | `cs (what)(to what)`
Toggle folding                                            | `space`
Toggle insert mode                                        | `leader p`
Yanking history with Quick navigation                     | `leader h`
Replace                                                   | `leader s`
Move between splits                                       | `leader w`
ESC                                                       | `j+k (simultaneously)`
Quick tab navigation                                      | `leader '`

### Color scheme

I use color scheme “Solarized”, the light version is enabled by default.
If you want the dark one, you have to change the following lines:
```vim
" Setting up light color scheme
set background=light

" set highlighting for colorcolumn
highlight ColorColumn ctermbg=lightGrey
```

to those:
```vim
" Setting up light color scheme
set background=dark

" set highlighting for colorcolumn
highlight ColorColumn ctermbg=darkGrey
```

### Full features list
#### Easy installation
You just need to place `.vimrc` in your home directory, and that's all. All
plugins and dependencies will install automatically upon first vim launch.
#### Folding
Folding is disabled by default, but you may fold any part of JS code according to
the syntax with just `Space` key.
#### Remember your last editing sessions
When you open file, which you used editted last, vim will open it on the exact
same line.
#### Vertical ruler
There is a vertical line indicating 80 character limit, it can be seen on
the screenshot above.
#### Smart search
Vim’s built-in search ignores case by default, but if you use mixed
lower/upper-case in the search pattern, it'll be case-sensitive.
#### Quick plugin install &mdash; [Neobundle](https://github.com/Shougo/neobundle.vim)
It's a bundler, which helps to install other bundles. It's quite smart and works better then
vundle.
#### Color Scheme &mdash; [Solarized](https://github.com/altercation/vim-colors-solarized)
A popular light/dark color scheme.

![Screen](https://raw.githubusercontent.com/altercation/solarized/master/img/solarized-vim.png)
#### Snippets &mdash; [Neosnippet](https://github.com/Shougo/neosnippet.vim) & [vim-snippets](https://github.com/honza/vim-snippets)
Neosnippet is a snippet engine itself, and Vim-snippets &mdash; it’s default snippets collection.

This config features snippets, which can be autocompleted by `tab`
аnd expanded by `Enter`. Here is [a full list of snippets](https://github.com/honza/vim-snippets/tree/master/snippets).

#### Smart panels &mdash; [Unite](https://github.com/Shougo/unite.vim)
Provides features like:
* Recent files list (with help of [neomru](https://github.com/Shougo/neomru.vim)).
* Quick tab navigation.
* Async fuzzySearch (with help of [vimproc](https://github.com/Shougo/vimproc.vim)).
* Grep/Ack integration.
* Yank/History.

#### On-the-go Syntax checker &mdash; [Syntastic](https://github.com/scrooloose/syntastic)
This plugin integrates many spellchekers and syntax checkers and shows
you errors when saving or opening a file.

By default this config use npm-packets [jshint](http://www.jshint.com/) and [css-lint](http://csslint.net/) to check js and css files on the fly.

#### Advanced file-system navigation &mdash; [NERDTree](https://github.com/scrooloose/nerdtree)
Imroved file-system navigation. Looks pretty much like the standard one but with some cool features like tree navigation, bookmarks, and some more.

#### Improved status line &mdash; [Airline](https://github.com/bling/vim-airline)
Nice and good loking status bar for vim, nicely integrated with syntastic and fugitive.

#### Good keyword completion system &mdash; [Neocomplcache](https://github.com/Shougo/neocomplcache.vim)
Provides smart autocompletion.

#### Integration with git &mdash; [Fugitive](https://github.com/tpope/vim-fugitive)
Provides full integration wit git.

#### Advanced javascript features &mdash; [Tern for Vim](https://github.com/marijnh/tern_for_vim)
Provides advanced javascript features like Smart variable rename, Find variable references, and Go to variable. If you use `.ternconf` &mdash; it'll improve autocompletion in your js files as well.


#### Improved syntax higlighting
* *Javascript* &mdash; [vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax)
* *JSX* &mdash; [vim-jsx](https://github.com/mxw/vim-jsx)
* *JSON* &mdash; [vim-json](https://github.com/elzr/vim-json)
* *CSS3* &mdash; [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)
* *Stylus* &mdash; [vim-stylus](https://github.com/wavded/vim-stylus)
* *Markdown* &mdash; [vim-markdown](https://github.com/tpope/vim-markdown)
* *Mustache/Handlebars* &mdash; [vim-mustache-handlebars](https://github.com/mustache/vim-mustache-handlebars)

#### Improved editing
* [DelimitMate](https://github.com/Raimondi/delimitMate) &mdash; provides automatic closing of quotes, parenthesis, brackets, etc., also has some other related features that will make your time in insert mode a little bit easier.
* [tcomment](https://github.com/tomtom/tcomment_vim) &mdash; tcomment provides easy-to-use, file-type sensible comments for Vim. It can handle embedded syntax.
* [surround](https://github.com/tpope/vim-surround) is all about “surroundings”: parentheses, brackets, quotes, XML tags, and more. The plugin provides keystrokes to easily delete, change and add such surroundings in pairs.
* [MatchTag](https://github.com/gregsexton/MatchTag) &mdash; highlights the matching HTML tag when the cursor is positioned on a tag. It works in much the same way as the MatchParen plugin.

### Installation

To install just clone the repo, and place symlink to .vimrc in your home directory. E.g.:
```bash
 git clone https://github.com/L0stSoul/vim-config.git && ln -s ~/vim-config/.vimrc ~/
```
[NPM](http://en.wikipedia.org/wiki/Npm_(software)) is required for some features.

### Pro Tips

If you want to make some changes, just fork the repo.
If these changes will be helpfull to others, don't forget to share it through a pull request :).
