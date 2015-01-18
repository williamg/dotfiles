#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# launch X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
