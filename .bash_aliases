# ~/.bash_aliases: executed by ~/.bashrc
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# aliases that fix typos
alias sl='ls'
alias amn='man'
alias mna='man'
alias ivm='vim'

# ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# cd aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'

# iptables aliases
alias ipt='iptables'
alias ipt-s='iptables-save'
alias ipt-r='iptables-restore'

# useless
alias vless='vim -u /usr/share/vim/vimcurrent/macros/less.vim'
#alias pwd='cowthink `/bin/pwd`'
# editor shortcut
alias e=$EDITOR
# ncmpc -> ncmpcpp
alias ncmpc='ncmpcpp'

# for vim ':q' shortcut
alias :q='exit'

# pushd/popd aliases
alias pu='pushd'
alias po='popd'

# bc alias
alias bc='bc -ql'

# aliases to avoid making mistakes (best for root)
if [[ $UID == "0" ]]; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
fi

# colorifying applications
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto --group-directories-first'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# grc utility aliases
if [ -x /usr/bin/grc ]; then
  alias make='grc -se make'
  alias ping='grc ping'
  alias netstat='grc netstat'
  alias traceroute='grc traceroute'
  alias ifconfig='grc ifconfig'
  alias diff='grc diff'
  alias df='grc df'
fi
