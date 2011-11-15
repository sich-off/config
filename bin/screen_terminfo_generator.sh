#!/bin/sh

# This script generates terminfo file for tmux
# which renders italics text as reversed.

mkdir -p $HOME/.terminfo

infocmp screen | sed \
    -e 's/%?%p1%t;3%/%?%p1%t;7%/' \
    -e 's/smso=[^,]*,/smso=\\E[7m,/' \
    -e 's/rmso=[^,]*,/rmso=\\E[27m,/' \
    -e '$s/$/ sitm=\\E[3m, ritm=\\E[23m,/' > /tmp/screen.terminfo

tic /tmp/screen.terminfo
rm /tmp/screen.terminfo
