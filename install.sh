#!/bin/sh
# this script installs config files to user home directory.

# variable which points to the same dir where the script is placed
HERE=`dirname $0`

# create needed dirs at $HOME
mkdir -p \
  $HOME/tmp \
  $HOME/.config

# install local binaries
mkdir -p $HOME/bin
cp -r $HERE/bin/* $HOME/bin/

# install bash files
cp $HERE/profile      $HOME/.profile
cp $HERE/bashrc       $HOME/.bashrc
cp $HERE/bash_aliases $HOME/.bash_aliases
cp $HERE/bash_logout  $HOME/.bash_logout

# copy vim config files
mkdir -p $HOME/.vim
cp -r $HERE/vim/* $HOME/.vim/
cp    $HERE/vimrc $HOME/.vimrc

# copy git config file
cp $HERE/gitconfig $HOME/.gitconfig

# install ncmpcpp config
mkdir -p $HOME/.ncmpcpp
cp $HERE/ncmpcpp/* $HOME/.ncmpcpp

# reportbug config
cp $HERE/reportbugrc $HOME/.reportbugrc

# install tmux configs
mkdir -p $HOME/.tmux
cp -r $HERE/tmux/* $HOME/.tmux/
cp    $HERE/tmux.conf $HOME/.tmux.conf

# awesome wm configs
cp -r $HERE/awesome $HOME/.config/

# copy needed files to $HOME
# X resource files
cp $HERE/Xresources $HOME/.Xresources

# generate terminfo file
$HOME/bin/screen_terminfo_generator.sh
