# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
export HISTSIZE=100000
export HISTFILESIZE=100000

shopt -s checkwinsize



export EDITOR='sublime'

PATH=$PATH:$HOME/bin


if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Setup Tmuxinator if it exists
if [ -s $HOME/.tmuxinator/scripts/tmuxinator ];
then
    . $HOME/.tmuxinator/scripts/tmuxinator
fi
if [ -s $HOME/.tmuxinator/scripts/tmuxinator_completion ];
then
    . $HOME/.tmuxinator/scripts/tmuxinator_completion
fi

# Load RVM if it exists
if [ -s $HOME/.rvm/scripts/rvm ];
then
    PATH=$PATH:$HOME/.rvm/bin
    . $HOME/.rvm/scripts/rvm
fi

alias aliases='source $HOME/.bash_aliases'

#PS1='[\u@\h \e[01;34m\w\e[00m]\n \e[01;31m\$\e[00m '


# Configure Colors:
COLOR_WHITE='\033[1;37m'
COLOR_LIGHTGRAY='033[0;37m'
COLOR_GRAY='\033[1;30m'
COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_LIGHTRED='\033[1;31m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHTGREEN='\033[1;32m'
COLOR_BROWN='\033[0;33m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[0;34m'
COLOR_LIGHTBLUE='\033[1;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_PINK='\033[1;35m'
COLOR_CYAN='\033[0;36m'
COLOR_LIGHTCYAN='\033[1;36m'
COLOR_DEFAULT='\033[0m'

# Function to set prompt_command to.
function promptcmd () {
    history -a

    PS1="[\u@"

    # Host
    if [[ ${SSH_CLIENT} ]] || [[ ${SSH2_CLIENT} ]]; then
        PS1="${PS1}\[${COLOR_PURPLE}\]\h "
    else
        PS1="${PS1}\[${COLOR_GREEN}\]\h "
    fi

    # Backgrounded running jobs
    # local BKGJBS=$(jobs -r | wc -l )
    # if [ ${BKGJBS} -gt 2 ]; then
    #     PS1="${PS1}\[${COLOR_RED}\][bg:${BKGJBS}] "
    # elif [ ${BKGJBS} -gt 0 ]; then
    #     PS1="${PS1}\[${COLOR_YELLOW}\][bg:${BKGJBS}] "
    # fi

    # Stopped Jobs
    local STPJBS=$(jobs -s | wc -l )
    if [ ${STPJBS} -gt 2 ]; then
        PS1="${PS1}\[${COLOR_RED}\][stp:${STPJBS}] "
    elif [ ${STPJBS} -gt 0 ]; then
        PS1="${PS1}\[${COLOR_YELLOW}\][stp:${STPJBS}] "
    fi

    PS1="${PS1}\[${COLOR_BLUE}\]\w\[${COLOR_CYAN}\]\$(__git_ps1)\[${COLOR_DEFAULT}\]]\n"

    PS1="${PS1}\[${COLOR_RED}\]\$\[${COLOR_DEFAULT}\] "
}


export PROMPT_COMMAND=promptcmd
export PROMPT_DIRTRIM=3
