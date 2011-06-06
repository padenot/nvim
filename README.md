# Paul's .vim directory (ViM 7.2 version)

## tl;dr 
You have ViM 7.2 and don't want to update. Okay boy, this ViM config has a
specially cooked version to cope with your lack of modernity.

Paste this into a terminal :

``
wget --no-check-certificate https://github.com/padenot/.vim/raw/7.2/bootstrap.sh -O - | sh
``

This will download the config files, and make sure that dependancies are
satisfied (mainly ctags and DroidSansMono.ttf font as well as ViM 7.3. If you
use 7.2 and don't want to / can't upgrade, try the 7.2 branch of this repository).

The only thing you'll miss (compared to the normal version) is the Gundo plugin,
which shows a fine undo tree will pressing the F5 key.

## Longer version & manual install

This is my ViM configuration, containing all my plugins, and my .vimrc file.
It requires ViM 7.2. ViM has to be compiled with
support for python scripting, and shall link against the same libraries
that it has been compiled to (use the  ``ldd`` command for troubleshooting).

I shall warn that I prefer spaces over tabs, and like 2 space indent.
I use DroidSansMono.ttf, and you should install ctags to have autocompletion
enabled.

You should simlink the vimrc file to ~/.vimrc, for this configuration to work.

    ln -s ~/.vim/vimrc ~/.vimrc

##Keybindings :
,

> Leader key

F4

> Remove search highlighting

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

,PP

> While in a .cpp file, pull declarations from .hpp file, and write snippet of definition.
