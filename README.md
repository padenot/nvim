# Paul's .vim direcotory

This is my ViM configuration, containing all my plugins, and my .vimrc file.
It requires ViM 7.3 for the Gundo plugin to work. ViM has to be compiled with
support for ruby and python scripting, and shall link against the same libraries
that it has been compiled to (use the  ``ldd`` command for troubleshooting).

I shall warn that I prefer spaces over tabs, and like 2 space indent.

You should simlink the vimrc file to ~/.vimrc, for this configuration to work.

Also, command-t should be installed manually:

    :e command-t.vba #open command-t.vba in vim
    :so % #source it

And then :

    cd ~/.vim/ruby/command-t
    ruby extconf.rb
    make

to build the native extension.

#Keybindings :
,

> Leader key

F4

> Remove search highlighting

F5

> Gundo panel toggle

F6

> Flush command-t cache

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

