alias edit='sublime'

function sublime() { command sublime "$@" &>/dev/null &}
function gitg() { command gitg --all "$@" &>/dev/null & }

alias ls='ls --color=auto'
alias grep='egrep -n --color=auto'
alias less='less -R'

alias rd='rm -r'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias find='~/bin/find.sh'
alias mycnf='~/bin/mycnf.sh'
alias workon='source ~/bin/workon.sh'
alias tmux='~/bin/tmux.sh'

# Git aliases
alias gg='git grep'
alias gd='git diff'
alias gdc='git diff --cached'
alias gspp='git stash && git pull && git stash pop'
alias gs='git status'

if [ -f $HOME/.bash_aliases.local ];
then
	. $HOME/.bash_aliases.local
fi
