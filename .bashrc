#
# ~/.bashrc
#

PYTHONPATH="${PYTHONPATH}:/usr/lib/python/"
export PYTHONPATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias get='sudo apt-get install'
alias pfind='ps -aux | grep $1'
alias opn='xdg-open'
alias off='sleep 1; xset dpms force off'
alias ack='ack-grep'

# Git log commands courtesy of Jake Zimmerman
# pretty Git log
alias gl='git log --graph --pretty="%C(bold green)%h%Creset%C(auto)%d%Creset %s"'
# pretty Git log, all references
alias gll='gl --all'
# pretty Git log, show authors
alias gla='git log --graph --pretty="%C(bold green)%h%Creset %C(yellow)%an%Creset%C(auto)%d%Creset %s"'
# pretty Git log, all references, show authors
alias glla='gla --all'

alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"



export PS1='\e[0;32m\u\e[m::\e[1;34m\W\e[m\$ '

# Colors:
export TERM=xterm-256color
. ~/.gruvbox_colors

export NVM_DIR="/home/william/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Pkg config
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
