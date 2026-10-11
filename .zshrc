HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

PROMPT='%n@%m:%~%# '

alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'
alias grep='grep --color=auto'
alias gccw='gcc -Wall -Wextra -g'

export EDITOR=vim
export PAGER=less
export PATH="$HOME/bin:$PATH"

autoload -Uz compinit && compinit

# boilersay
export PATH="$HOME/.local/bin:$PATH"
alias boilersay='cowsay -f train'
alias hail='printf "Hammer Up\nBoiler Down\nHail Purdue\n" | boilersay -n'
