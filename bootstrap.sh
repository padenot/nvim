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

# font
locate $font && "DroidSansMono.ttf found." || install_font

# ctags
ctags && echo "ctags found" || sudo apt-get -y install ctags

# fetch config
cd ~ && git clone git://github.com/padenot/.vim/ && echo "Clone OK"

cd .vim && git pull origin 7.2

# symlink .vimrc
ln -s ~/.vim/vimrc ~/.vimrc
