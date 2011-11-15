# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
  return
fi

# ignore duplicate lines and space lines in history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# explicitly set history size
HISTFILESIZE=10000
HISTSIZE=10000

# set date for each history entry
HISTTIMEFORMAT='%Y/%m/%d %T %z: '

# view man pages through vim
#export MANPAGER="sh -c \"col -b | view -c 'set ft=man' -\""

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi

# Use a vi-style command line editinig interface
#set -o vi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

dark='\[\033[01;30m\]';
red='\[\033[01;31m\]';
green='\[\033[01;32m\]';
yellow='\[\033[01;33m\]';
blue='\[\033[01;34m\]';
purple='\[\033[01;35m\]';
cyan='\[\033[01;36m\]';
normal='\[\033[00m\]';

# __prompt_sign function {{{
__prompt_sign() {
  local red='\033[01;31m'
  local yellow='\033[01;33m'
  local normal='\033[00m'

  if [[ $UID == "0" ]]; then
    echo -ne $red'#'
  else
    echo -ne $yellow'$'
  fi
  echo -ne $normal' '
}
#}}}
# __prompt_errorcode function {{{
__prompt_errorcode() {
  local err=$?
  local red='\033[01;31m'
  local normal='\033[00m'

  if [[ $err != "0" ]]; then
    echo -ne $red"($err)"$normal" "
  else
    echo -ne "(0) "
  fi
}
#}}}

if [ "$color_prompt" = yes ]; then
  # add error code
  PS1='`__prompt_errorcode`'
  # for chroot, not tested
  PS1=$PS1'${debian_chroot:+($debian_chroot)}'
  # add $/# sign
  PS1=$PS1'`__prompt_sign`'
  # add clock
  PS1=$PS1$dark'\t '
  # add username@hostname:path
  PS1=$PS1$green'\u'$normal'@'$cyan'\h'$normal': '$blue'\w'
  # next line
  PS1=$PS1$normal'\n> '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset dark red green yellow blue purple cyan normal
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    trap 'echo -ne "\e]0;$BASH_COMMAND ($PWD)\a"' DEBUG
    ;;
  *)
    ;;
esac

# Colorify man pages using less variables
man()
{
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;36m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;43;30m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[4;35m") \
    man "$@"
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi
