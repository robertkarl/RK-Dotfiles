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
