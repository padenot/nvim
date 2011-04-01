# Paul's .vim directory

This is my ViM configuration, containing all my plugins, and my .vimrc file.
It requires ViM 7.3 for the Gundo plugin to work. ViM has to be compiled with
support for python scripting, and shall link against the same libraries
that it has been compiled to (use the  ``ldd`` command for troubleshooting).

I shall warn that I prefer spaces over tabs, and like 2 space indent.

You should simlink the vimrc file to ~/.vimrc, for this configuration to work.

    ln -s ~/.vim/vimrc ~/.vimrc

#Keybindings :
,

> Leader key

F4

> Remove search highlighting

F5

> Gundo panel toggle

F7

> Tag panel toggle

ctrl+F12

> Generate ctags file for current directory (recursive).

,a=

> Tabulatize on = signs

,a|

> Tabularize on | signs

:Implement

> On .h file, create the corresponding .cpp file with implementation.

Ctrl+Tab

> Alternate between .cpp & .h.

,t

> Open fuzzy file searching (ctrl+l to open in a new tab)

ctrl+j, ctrl+k

> Previous/next tab
