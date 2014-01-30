### Vim config for web development

<img src="http://i.imgur.com/ElOEHZ3.png"/>

### Features
* Only one file, you don't need manually run any install script
* Integration with Git
* Integration with grep/ack
* Automatic syntax and codestyle checks
* Smart autocomplete
* Tweeks for easier navigation
* Snippets
* Fully documented
* Optimized for web development
* Quick Tab navigation, Most recent files list, fuzzy search, and many other features (see full features list)

### Hotkeys
In Vim there is ```leader``` key, which by default &mdash; ```\``` , but you can change it in any
time.

Action | Hotkey
--------------------------------------------------------- | -----------------
**▶ File operations**                                     |
Most recent Files List                                    | ```leader m```
FuzzyFinder fo files                                      | ```leader ;```
Ack/Grep                                                  | ```leader /```
Show current file in NERDtree in a split                  | ```leader f```
**▶ Jshint/csslint navigation**                           |
Show error window                                         | ```leader ll```
Go to next string with error/warning                      | ```]```
Go to previous string with error/warning                  | ```[```
**▶ Javascript advanced features (if Tern is available)** |
If variable under cursor, go to it's definition           | ```leader td```
Find all refs for variable under cursor                   | ```leader tr```
Smart rename variable and all references on it            | ```leader tn```
**▶ Code complete**                                       |
Start autocompletion                                      | ```tab```
Undo autocompletion                                       | ```ctrl+e```
Expand snippet                                            | ```Enter```
**▶ Integration with Git**                                |
Git blame on current line or all selected lines           | ```leader b```
Git status                                                | ```leader gst```
Git add/checkout file                                     | ```leader gw```
Git diff                                                  | ```leader gd```
Git commit                                                | ```leader gc```
Git commit all                                            | ```leader gca```
Git commit -a --amend                                     | ```leader gcf```
**▶ Other**                                               |
Toggle comment on current line                            | ```gcc```
Toggle comments                                           | ```gc in vicsual mode, or gc + motion```
Change surrounding symbols(like [ or ")                   | ```cs (what)(to what)```
Toggle fold                                               | ```space```
Toggle insert mode                                        | ```leader p```
Yanking history with quick navigation                     | ```leader h```
Quick tab navigation                                      | ```leader '```

### Colorscheme

I use colorscheme Solarized, light version is enable by default .
If you want dark one, you have to change this lines:
```
" Setting up light color scheme
set background=light

" set highlighting for colorcolumn
highlight ColorColumn ctermbg=lightGrey
```

Into this:
```
" Setting up light color scheme
set background=dark

" set highlighting for colorcolumn
highlight ColorColumn ctermbg=darkGrey
```

### Full features list
#### Easy install
You just need to place ```.vimrc``` in your home directory, that's all. All
plugins and dependencies will install automatically.
#### Folding
Folding is disable by default, but you may fold any part of js code according to
syntax with just ```space``` key.
#### Remember your last editing sessions
When you open file, which you previously edits vim will open it in the exact
same line.
#### Vertical ruler
There are vertical line that indicates 80 character border, you can see it at
screenshrot above
#### Smart search
Vim built-in search are ignore case by default, but if you use mixed
lower/Upper case as search phrase, he start pay attention to case
#### Quick plugin install &mdash; [Neobundle](https://github.com/Shougo/neobundle.vim)
It's a bundler which helps me to install other bundles, it's quite smart and work better then
vundle.
#### Colorscheme &mdash; [Solarized](https://github.com/altercation/vim-colors-solarized)
Popular light/dark colorscheme

![Screen](https://raw2.github.com/altercation/solarized/master/img/solarized-vim.png)
#### Snippets &mdash; [Neosnippet](https://github.com/Shougo/neosnippet.vim) & [vim-snippets](https://github.com/honza/vim-snippets)
Neosnippet - It's a snippets engine itself, and Vim-snippets - it's default snippets collection

This config features snippets, which can be autocompleted by ```tab```,
аnd expanded by ```Enter``` you can view a full list of snippets [here](https://github.com/honza/vim-snippets/tree/master/snippets)

#### Smart panels &mdash; [Unite](https://github.com/Shougo/unite.vim)
It provide such features as:
* Most recent files list (with help of [neomru](https://github.com/Shougo/neomru.vim))
* Quick tab navigation
* Async fuzzySearch (with help of [vimproc](https://github.com/Shougo/vimproc.vim))
* Grep/Ack integration
* Yank/History

#### On-the-go Syntax checker &mdash; [Syntastic](https://github.com/scrooloose/syntastic)
This plugin, integrate many spellchekers and syntax checkers, and manage to tell
you about errors when you save your code, or open new file.

by default this config use npm-packets [jshint](http://www.jshint.com/) and [css-lint](http://csslint.net/) for check js and css files on the fly.

#### Advanced file-system navigation &mdash; [NERDTree](https://github.com/scrooloose/nerdtree)
Imroved file-system navigation. Looks pretty much like standart one but with some kool features like tree navigation, bookmarks, and some more.

#### Improved status line &mdash; [Airline](https://github.com/bling/vim-airline)
Nice and good loking status bar for vim, with integration with syntastic and fugitive.

#### Good keyword completion system &mdash; [Neocomplcache](https://github.com/Shougo/neocomplcache.vim)
Provide smart autocompletion 

#### Integration with git &mdash; [Fugitive](https://github.com/tpope/vim-fugitive)
Provide full integration wit git.

#### Advanced javascript features &mdash; [Tern for Vim](https://github.com/marijnh/tern_for_vim)
Provide advanced javascritp feature like smart variable rename, find variable references, and go to variable. if you use .ternconf - it improve autocompletion in your js files to.
#### Improved editing
* [DelimitMate](https://github.com/Raimondi/delimitMate) &mdash; provides automatic closing of quotes, parenthesis, brackets, etc., besides some other related features that should make your time in insert mode a little bit easie.
* [tcomment](https://github.com/tomtom/tcomment_vim) &mdash; tcomment provides easy to use, file-type sensible comments for Vim. It can handle embedded syntax.
* [surround](https://github.com/tpope/vim-surround) &mdash; is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
* [MatchTag](https://github.com/gregsexton/MatchTag) &mdash; highlights the matching HTML tag when the cursor is positioned on a tag. It works in much the same way as the MatchParen plugin.

### Installation

To install just place symlink to .vimrc in your home directory.
For some features you need [npm](http://en.wikipedia.org/wiki/Npm_(software)) installed

### Pro Tips

If you want to make some changes, just fork the repo.
If this changes will be helpfull for others, don't forget to share it through pull request :)

