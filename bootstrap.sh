#!/bin/sh

font="MesloLGS-DZ-Regular.ttf"

Color_Off='\033[0m'       # Text Reset
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green

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
    message "Backuping $1"
    mv --backup=numbered $1 $1.old
    if [ $? ]
    then
      error "Could not backup $1."
    else
      ok "$1 backuped to $1.old."
    fi
  else
    error "$1 doesn't exist"
  fi
}

install_font() {
  mkdir -p ~/.fonts/
  wget paul.cx/public/$font -O ~/.fonts/$font
}

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
  ok "Meslo font already available on the system."
else
  install_font $font
fi

# ctags
if ctags --version
then
  ok "ctags found."
else
  message "ctags not found on the system. Installing..."
  sudo apt-get -y install ctags
  if [ $? ]
  then
    ok "ctags installed."
  else
    error "Error while installing ctags."
  fi
fi

if git --version
then
  ok "git found."
else
  message "git not found on the system. Installing..."
  sudo apt-get -y install git
  if [ $? ]
  then
    ok "git installed"
  else
    error "Error while installing git"
  fi
fi

cd ~

if [ -d ~/.vim ]
then
  backup ~/.vim
fi

if [ -e ~/.vimrc ]
then
  backup ~/.vimrc
fi

if [ -L ~/.vimrc ]
then
  rm ~/.vimrc
fi

git clone git://github.com/padenot/.vim

if [ $? ]
then
  ok "Repository cloned sucessfully."
else
  error "Could not clone repository."
fi

ln -s ~/.vim/vimrc ~/.vimrc
if [ $? ]
then
  ok "Config symlinked successfully."
else
  error "Cound not symlink the config."
fi
