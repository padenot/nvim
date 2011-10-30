#!/bin/sh

font="MesloLGS-DZ-Regular.ttf"

Color_Off='\e[0m'       # Text Reset
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green

# $1 : the message
message() {
  echo "$1"
}

# $1 : the error message
error() {
  echo "${BIRed}$1${Color_Off}"
}

# $1 : a message.
ok() {
  echo "${BIGreen}$1${Color_Off}"
}

# $1 : the font to check.
font_exist() {
  if [ -e ~/.fonts/$1 ]
  then
    return 0
  elif [ -e /usr/share/fonts/$1 ]
  then
    return 0
  fi

  return 1
}

# $1 : the file to check.
file_exist() {
  if [ -e $1 ]
  then
    return 0
  fi
  return 1
}

# copy the file and append .old to the name.
# $1 : the file to backup
backup() {
  if [ -e $1 ]
  then
    mv $1 $1.old
  else
    error "$1 doesn't exist"
  fi
}

install_font() {
  mkdir -p ~/.fonts/
  wget paul.cx/public/$font -O ~/.fonts/$font
}

[ -d ~/.vim ] && backup_old

# vim version
if [ -z $(vim --version | grep -o 7.3) ]
then
  error "This vim configuration needs Vim 7.3"
else
  ok "Found Vim 7.3"
fi

# font
if font_exist $font
then
  install_font
else
  ok "Meslo font already available on the system."
fi

# ctags
if ctags --version
then
  ok "ctags found."
else
  message "ctags not found on the system. Installing..."
  sudo apt-get -y install ctags
  if $?
  then
    error "Error while installing ctags."
  else
    ok "ctags installed."
  fi
fi

if git --version
then
  ok "git found."
else
  message "git not found on the system. Installing..."
  sudo apt-get -y install git
  if $?
  then
    error "Error while installing git"
  else
    ok "git installed"
  fi
fi

cd ~

git clone git://github.com/padenot/.vim && echo "Clone OK"

if $?
then
  error "Could not clone repository."
else
  ok "Repository cloned sucessfully."
fi

ln -s ~/.vim/vimrc ~/.vimrc
if $?
then
  error "Cound not symlink the config."
else
  ok "Config symlinked successfully."
fi

vim ~/.vim/README.md
