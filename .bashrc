HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend

PS1='\u@\h:\w\$ '

alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'
alias grep='grep --color=auto'
alias gccw='gcc -Wall -Wextra -g'

export EDITOR=vim
export PAGER=less
export PATH="$HOME/bin:$PATH"
