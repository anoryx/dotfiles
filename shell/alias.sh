#!/usr/bin/env bash

# short and sweet
alias g="git"
alias h="history"

## Safety Aliases
alias rm="rm -I" # -i prompts every file
alias cp="cp -i"
alias mv="mv -i"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"

## Easier directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias pu="pushd"
alias po="popd"

# always create parent-dirs
alias mkdir="mkdir -p"
alias md="mkdir"

# rmdir
alias rd="rmdir"

# dirs
alias d="dirs -v | head -10"

# Enable aliases to be sudo’ed
alias sudo='sudo '
alias _='sudo'
alias please='sudo'

# use vim
if which vim >/dev/null 2>&1; then
    alias vi="vim"
fi

# add ssh-key to ssh-agent when key exist
if [ "$SSH_AUTH_SOCK" != "" ] && [ -f ~/.ssh/id_rsa ] && [ -x /usr/bin/ssh-add  ]; then
  ssh-add -l >/dev/null || alias ssh='(ssh-add -l >/dev/null || ssh-add) && unalias ssh; ssh'
fi

# dmesg with readable time
alias dmesg="dmesg -T"

# ------------------------------------------------------------------------------
# | COLORS!                                                                    |
# ------------------------------------------------------------------------------
if [ "$TERM" != "dumb" ]; then

    # dircolors
    if [[ "$SYSTEM_TYPE" == "LINUX" || "$SYSTEM_TYPE" == "CYGWIN" ]]; then
        if [ -s "$HOME/.dircolors" ]; then
            eval "$(dircolors -b $HOME/.dircolors)"
        else
            eval "$(dircolors -b)"
        fi
    fi

    #enable ls colors
    if [[ "$DISABLE_LS_COLORS" != "true" ]]; then
        if [[ "$SYSTEM_TYPE" == "OSX" ]]; then
            COLORFLAG="-G"
        elif ls --color -d . &>/dev/null 2>&1; then
            COLORFLAG="--color"
            if [[ "$SYSTEM_TYPE" == "LINUX" || "$SYSTEM_TYPE" == "CYGWIN" ]]; then
                COLORFLAG="--color=auto"
            fi
        fi
    fi

    # Use "colordiff" or "highlight" to colour diffs.
    if command -v colordiff > /dev/null; then
        alias difflight="colordiff"
    elif command -v highlight > /dev/null; then
        alias difflight="highlight --dark-red ^-.* \
        | highlight --dark-green ^+.* \
        | highlight --yellow ^Only.* \
        | highlight --yellow ^Files.*differ$ \
        | less -XFIRd"
    else
        alias difflight="less -XFIRd"
    fi

    # Use GRC for additionnal colorization
    if which grc >/dev/null 2>&1; then
        alias colour="grc -es --colour=auto"
        alias as="colour as"
        alias configure="colour ./configure"
        alias diff="colour diff"
        alias dig="colour dig"
        alias g++="colour g++"
        alias gas="colour gas"
        alias gcc="colour gcc"
        alias head="colour head"
        alias ifconfig="colour ifconfig"
        alias ld="colour ld"
        alias ls="colour ls"
        alias make="colour make"
        alias mount="colour mount"
        alias netstat="colour netstat"
        alias ping="colour ping"
        alias ps="colour ps"
        alias tail="colour tail"
        alias traceroute="colour traceroute"
        alias syslog="sudo colour tail -f -n 100 /var/log/syslog"
    fi

    # replace top with htop
    if command -v htop >/dev/null; then
        alias top_orig="/usr/bin/top"
        alias top="htop"
    fi
fi

# ------------------------------------------------------------------------------
# | List Directory Contents (ls)                                               |
# ------------------------------------------------------------------------------

# list all files colorized in long format
alias l="ls -lhF $COLORFLAG"
# list all files with directories
alias ldir="l -R"
# Show hidden files
alias l.="ls -dlhF .* $COLORFLAG"
alias ldot="l."
# use colors
alias ls="ls -F $COLORFLAG"
# display only files & dir in a v-aling view
alias l1="ls -1 $COLORFLAG"
# displays all files and directories in detail
alias la="ls -laFh $COLORFLAG"
# displays all files and directories in detail (without "." and without "..")
alias lA="ls -lAFh $COLORFLAG"
alias lsa="la"
# displays all files and directories in detail with newest-files at bottom
alias lr="ls -laFhtr $COLORFLAG"
# show last 10 recently changed files
alias lt="ls -altr | grep -v '^d' | tail -n 10"
# show files and directories (also in sub-dir) that was touched in the last hour
alias lf="find ./* -ctime -1 | xargs ls -ltr $COLORFLAG"
# displays files and directories in detail
alias ll="ls -lFh --group-directories-first $COLORFLAG"
# shows the most recently modified files at the bottom of
alias llr="ls -lartFh --group-directories-first $COLORFLAG"
# list only directories
alias lsd="ls -lFh $COLORFLAG | grep --color=never '^d'"
# sort by file-size
alias lS="ls -1FSshr $COLORFLAG"
# displays files and directories
alias dir="ls --format=vertical $COLORFLAG"
# displays more information about files and directories
alias vdir="ls --format=long $COLORFLAG"

# tree (with fallback)
if which tree >/dev/null 2>&1; then
    # displays a directory tree
    alias tree="tree -Csu"
    # displays a directory tree - paginated
    alias ltree="tree -Csu | less -R"
else
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
    alias ltree="tree | less -R"
fi

# ------------------------------------------------------------------------------
# | Search and Find                                                            |
# ------------------------------------------------------------------------------
# super-grep ;)
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

