#
# ~/.bashrc
#

PATH="/data/documents/programming/sources/box-linux-sync/bin:~/.config/bspwm/panel/:~/.gem/ruby/2.1.0/bin:~/bin/:$PATH"

PYTHONPATH="${PYTHONPATH}:/usr/lib/python/"
export PYTHONPATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias get='sudo apt-get install'
alias pfind='ps -aux | grep $1'
alias opn='xdg-open'
alias off='xset dpms force off'

# Git log commands courtesy of Jake Zimmerman
# pretty Git log
alias gl='git log --graph --pretty="%C(bold green)%h%Creset%C(auto)%d%Creset %s"'
# pretty Git log, all references
alias gll='gl --all'
# pretty Git log, show authors
alias gla='git log --graph --pretty="%C(bold green)%h%Creset %C(yellow)%an%Creset%C(auto)%d%Creset %s"'
# pretty Git log, all references, show authors
alias glla='gla --all'



export PS1='\e[0;34m\u\e[m::\e[1;36m\W\e[m\$ '

# Colors:
export TERM=xterm-256color
eval `dircolors ~/.dir_colors`
