# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Set vim as default editor
export EDITOR=vim
# export VIMINIT='source $HOME/.config/.vimrc'

# Aktivuj barevné výpisy pro completion
bind "set colored-completion-prefix on"
bind "set colored-stats on"

# User specific aliases and functions
PS1='\[\e[38;5;129m\]\t\[\e[0m\] \[\e[94;1m\]\u\[\e[0m\] \w\n\$ '

# Aliases
# alias meow='cat'
