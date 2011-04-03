#!/bin/sh

font="DroidSansMono.ttf"

install_font()
{
  wget paul.cx/$font -O ~/.fonts/$font
}

# vim version
[ -z $(vim --version | grep -o 7.3) ] && echo "You need ViM 7.3." && exit 1 
echo "ViM version OK."

locate $font && "DroidSansMono.ttf found." || install_font

ctags && echo "ctags found" || sudo apt-get -y install ctags

cd ~ && git clone git://github.com/padenot/.vim && echo "Clone OK"

