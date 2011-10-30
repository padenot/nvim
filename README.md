# Paul's .vim directory

## tl;dr 
Paste this into a terminal, if you are using Debian or Ubuntu :

``
wget https://github.com/padenot/.vim/raw/master/bootstrap.sh -O - | sh
``

This will download the config files, and make sure that dependancies are
satisfied (mainly ctags and Meslo font as well as ViM 7.3.

## Longer version & manual install

This is my ViM configuration, containing all my plugins, and my .vimrc file.
It requires ViM 7.3 for the Gundo plugin to work. ViM has to be compiled with
support for python scripting, and shall link against the same libraries
that it has been compiled to (use the  ``ldd`` command for troubleshooting).

I shall warn that I prefer spaces over tabs, and like 2 space indent.
I use Meslo as a font, and you should install ctags to have autocompletion
enabled.

You should simlink the vimrc file to ~/.vimrc, for this configuration to work.

    ln -s ~/.vim/vimrc ~/.vimrc

After cloning the repo, issue these commands : 
```sh
cd .vim
git submodule init
git submodule update
```

To update the plugins :
```sh
cd .vim
sh update.sh
```

##Keybindings :
,

> Leader key

F4

> Remove search highlighting

F5

> Gundo panel toggle

F6

> Tagbar panel toggle

ctrl+F12

> Generate ctags file for current directory (recursive).

,a=

> Tabulatize on = signs

,a|

> Tabularize on | signs

Ctrl+Tab

> Alternate between .cpp & .h and other file pairs

,t

> Open fuzzy file searching (ctrl+l to open in a new tab)

ctrl+j, ctrl+k

> Previous/next tab

TAB

> Fold or unfold. Folds are created automatically

:w!!

> Write the file when `sudo` has been forgotten

ctrl+r+u

> Call the program ~/bin/uuidgen.py, available [here](http://paul.cx/public/uuidgen.py)

F8, F9

> Change a hex color under the cursor up or down by one shade.

## Plugin list :
- Fswitch : switch between `.h` and `.cpp` using ctrl+tab
- Fuzzyfinder : `,t` to fuzzy search files
- Gundo : `F5` open the undo tree
- Indent-guides : Display nice indent guides
- Markdown : nice markdown syntax coloring (plus goodies for Jekyll authoring)
- Nerdcommenter : `,cc` comments
- Orgmode : `emacs` orgmode clone
- Processing : syntax coloring for Processing
- Speeddating : increment or decrement dates
- Surround : surround things using `S` while in visual mode
- Syntastic : static analysis when the files are saved
- Tabular : align things
- Tagbar : outline functions, methods, classes and such
- Ultisnips : snippet library, includes goodies for Jekyll authoring and nspr developement
- delimitMate.vim : auto insert pair charaters in a smart way
- DoxygenToolkit.vim : :Dox while over a prototype inserts a Doxygen comment block
- rst_table.vim : utility to ease authoring of table in reStructuredText
- SearchComplete.vim : autocomplete the search
- textformat.vim : justify text and more (`,a[l|r|j|c]`, to align left, right, justified, center)

