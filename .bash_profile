
unameval="$(uname -s)"
case "${unameval}" in
    Linux*)     ;;
    Darwin*)
# List in color, and append slashes to directories.
# Use \ls in the shell to get the default behavior
alias ls='ls -FG'
;;
    CYGWIN*)    ;;
    *) 
esac

##########
# Unlimited history without duplicates

export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=erasedups

###########
# SSH Setup
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

########
# Prompt
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs
function __prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    PS1+="\u @ \h \w\n"

    if [ $EXIT != 0 ]; then
        PS1+="${Red}\$ ${RCol}"      # Add red if exit code non 0
    else
        PS1+="${Gre}\$ ${RCol}"
    fi

}
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

