#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# launch X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

PATH="~/.config/bspwm/panel/:~/.gem/ruby/2.1.0/bin:~/bin/:$PATH"
