#!/bin/sh

font="DroidSansMono.ttf"

install_font()
{
  mkdir -p ~/.fonts/
  wget paul.cx/$font -O ~/.fonts/$font
}

backup_old()
{
  mv -f ~/.vim ~/.vim.old
  mv -f ~/.vimrc ~/.vimrc.old
}

backup_old

# vim version
[ -z $(vim --version | grep -o 7.3) ] && echo "You need ViM 7.3." && exit 1 
echo "ViM version OK."

# font
locate $font && "DroidSansMono.ttf found." || install_font

# ctags
ctags && echo "ctags found" || sudo apt-get -y install ctags

# fetch config
cd ~ && git clone git://github.com/padenot/.vim && echo "Clone OK"

# symlink .vimrc
ln -s ~/.vim/vimrc ~/.vimrc
