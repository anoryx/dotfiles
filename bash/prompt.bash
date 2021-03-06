## Color Definitions

_prompt_cfg() {

    if $SHELL_BASH; then
        local USER_SYMBOL="\u"
        local HOST_SYMBOL="\h"
        local ESC_OPEN="\["
        local ESC_CLOSE="\]"
    else
        # Assume zsh
        local USER_SYMBOL="%n"
        local HOST_SYMBOL=%m
        local ESC_OPEN="%{"
        local ESC_CLOSE="%}"
    fi


    if tput setaf >/dev/null 2>&1 ; then
        _setaf () { tput setaf "$1" ; }
        local RESET="${ESC_OPEN}$( { tput sgr0 || tput me ; } 2>/dev/null )${ESC_CLOSE}"
        local BOLD="$( { tput bold || tput md ; } 2>/dev/null )"
    else
        # Fallback
        _setaf () { echo "\033[0;$(($1+30))m" ; }
        local RESET="\033[m"
        local BOLD=""
        ESC_OPEN=""
        ESC_CLOSE=""
    fi

    # Normal colors
    local BLACK="${ESC_OPEN}$(_setaf 0)${ESC_CLOSE}"
    local RED="${ESC_OPEN}$(_setaf 1)${ESC_CLOSE}"
    local GREEN="${ESC_OPEN}$(_setaf 2)${ESC_CLOSE}"
    local YELLOW="${ESC_OPEN}$(_setaf 3)${ESC_CLOSE}"
    local BLUE="${ESC_OPEN}$(_setaf 4)${ESC_CLOSE}"
    local VIOLET="${ESC_OPEN}$(_setaf 5)${ESC_CLOSE}"
    local CYAN="${ESC_OPEN}$(_setaf 6)${ESC_CLOSE}"
    local WHITE="${ESC_OPEN}$(_setaf 7)${ESC_CLOSE}"

    # Bright colors
    local BRIGHT_GREEN="${ESC_OPEN}$(_setaf 10)${ESC_CLOSE}"
    local BRIGHT_YELLOW="${ESC_OPEN}$(_setaf 11)${ESC_CLOSE}"
    local BRIGHT_BLUE="${ESC_OPEN}$(_setaf 12)${ESC_CLOSE}"
    local BRIGHT_VIOLET="${ESC_OPEN}$(_setaf 13)${ESC_CLOSE}"
    local BRIGHT_CYAN="${ESC_OPEN}$(_setaf 14)${ESC_CLOSE}"
    local BRIGHT_WHITE="${ESC_OPEN}$(_setaf 15)${ESC_CLOSE}"

    # Bold colors
    local BLACK_BOLD="${ESC_OPEN}${BOLD}$(_setaf 0)${ESC_CLOSE}"
    local RED_BOLD="${ESC_OPEN}${BOLD}$(_setaf 1)${ESC_CLOSE}"
    local GREEN_BOLD="${ESC_OPEN}${BOLD}$(_setaf 2)${ESC_CLOSE}"
    local YELLOW_BOLD="${ESC_OPEN}${BOLD}$(_setaf 3)${ESC_CLOSE}"
    local BLUE_BOLD="${ESC_OPEN}${BOLD}$(_setaf 4)${ESC_CLOSE}"
    local VIOLET_BOLD="${ESC_OPEN}${BOLD}$(_setaf 5)${ESC_CLOSE}"
    local CYAN_BOLD="${ESC_OPEN}${BOLD}$(_setaf 6)${ESC_CLOSE}"
    local WHITE_BOLD="${ESC_OPEN}${BOLD}$(_setaf 7)${ESC_CLOSE}"

    # Expose the variables we need in prompt command
    P_USER=${BLUE}${USER_SYMBOL}
    P_HOST=${BLUE}${HOST_SYMBOL}
    P_CYAN=${CYAN}
    P_WHITE=${WHITE}
    P_GREEN=${GREEN}
    P_YELLOW=${YELLOW}
    P_RED=${RED}
    P_RESET=${RESET}
    P_VIOLET=${VIOLET}
    P_BVIOLET=${BRIGHT_VIOLET}
    P_BYELLOW=${BRIGHT_YELLOW}
}

parse_git_branch() {
    local OUT=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ "$OUT" != "" ]; then echo " $OUT"; fi
}

python_venv() {
    if [[ $VIRTUAL_ENV != "" ]]
    then
        venv="${P_VIOLET}[${VIRTUAL_ENV##*/}] "
    else
        venv=""
    fi
    echo "$venv"
}

parse_kubectl_context() {
    if [[ -v KUBECONFIG ]]; then
        local CONTEXT=$(cat ${KUBECONFIG} | grep "current-context:" | sed "s/current-context: //")
        if [[ -n "$CONTEXT" ]]; then
            echo " (k8s: ${CONTEXT}) "
        fi
    fi
}


prompt_cmd() {
    local EXIT_CODE=$?
    local P_EXIT=""
    local MAXLENGTH=35
    local TRUNC_SYMBOL=".."
    local DIR=${PWD##*/}
    local P_PWD=${PWD/#$HOME/\~}

    MAXLENGTH=$(( ( MAXLENGTH < ${#DIR} ) ? ${#DIR} : MAXLENGTH ))

    local OFFSET=$(( ${#P_PWD} - MAXLENGTH ))

    if [ ${OFFSET} -gt "0" ]; then
        P_PWD=${P_PWD:$OFFSET:$MAXLENGTH}
        P_PWD=${TRUNC_SYMBOL}/${P_PWD#*/}
    fi

    local P_GIT=$(parse_git_branch)
    local P_VENV=$(python_venv)
    local P_K8S=$(parse_kubectl_context)
    # Exit code
    if [[ $EXIT_CODE != 0 ]]; then
        P_EXIT+="${P_RED}✘"
    else
        P_EXIT+="${P_GREEN}✓"
    fi
    PS1=""
    PS1+="\n${P_VENV}${P_USER}${P_CYAN}@${P_HOST}${P_VIOLET}:${P_YELLOW}${P_PWD}${P_GREEN}${P_GIT}${P_BYELLOW}${P_K8S}"
    PS1+="\n${P_EXIT} ${P_BVIOLET}\$ ${P_RESET}"
}

_prompt_cfg
unset _prompt_cfg

if $SHELL_BASH; then
    PROMPT_COMMAND=prompt_cmd
else
    # Assume zsh
    function precmd {
        prompt_cmd
    }
fi
