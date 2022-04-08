########!/usr/bin/env bash

### Detect your OS
case "$OSTYPE" in
  solaris*) SYSTEM_TYPE="SOLARIS" ;;
  darwin*)  SYSTEM_TYPE="OSX" ;;
  linux*)   SYSTEM_TYPE="LINUX" ;;
  bsd*)     SYSTEM_TYPE="BSD" ;;
  msys*)    SYSTEM_TYPE="MINGW" ;;
  cygwin*)  SYSTEM_TYPE="CYGWIN" ;;
esac

if [[ "$(uname)" == "Darwin" ]]; then
  SYSTEM_TYPE="OSX"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  SYSTEM_TYPE="LINUX"
elif [[ "$(expr substr $(uname -s) 1 7)" == "FreeBSD" ]]; then
  SYSTEM_TYPE="FREE_BSD"
elif [[ "$(expr substr $(uname -s) 1 6)" == "NetBSD" ]]; then
  SYSTEM_TYPE="NET_BSD"
elif [[ "$(expr substr $(uname -s) 1 7)" == "OpenBSD" ]]; then
  SYSTEM_TYPE="OPEN_BSD"
elif [[ "$(expr substr $(uname -s) 1 7)" == "MSYS_NT" ]]; then
  SYSTEM_TYPE="MINGW"
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
  SYSTEM_TYPE="MINGW"
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]; then
  SYSTEM_TYPE="MINGW"
elif [[ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]]; then
  SYSTEM_TYPE="CYGWIN"
fi

export SYSTEM_TYPE

###
# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE=${HISTSIZE:-32768}
export HISTFILESIZE=$HISTSIZE
# Omit duplicates, shutdown cmds, etc.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
export HISTIGNORE=${HISTIGNORE:-"shutdown*:halt*poweroff*hibernate*:rm -rf*"}
export HISTTIMEFORMAT=${HISTTIMEFORMAT:-"%Y-%m-%d %H:%M:%S  "}
### less options
less_options=(
    # just dump it and quit if fits on screen
    --quit-if-one-screen
    # don't clear screen
    --no-init
    # ignore case unless search pattern is mixed
    --ignore-case
    # allow ANSI color but no other escapes
    --RAW-CONTROL-CHARS
    # do not ring bell when scrolling past end
    --quiet
    # do not complain on dumb terminal
    --dumb
);
export LESS="-iMX --shift 5 ${less_options[*]}"
unset less_options

# highlight section titles in manual pages
export LESSHISTFILE="-"     # no less history file
if [ "$UID" != 0 ]; then
    export LESSCHARSET=${LESSCHARSET:-"utf-8"}

    [ -x "`which lesspipe 2>/dev/null`" ] && eval "$(lesspipe)"

    # yep, 'less' can colorize manpages
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
fi

# don’t clear the screen after quitting a manual page
export MANPAGER=${MANPAGER:-"less -X"}

# Make vim the default editor.
export EDITOR='vim';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

### colors
# try to enable colored output
if [ -x dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colorscheme for OS X `ls` environment variable:
export CLICOLOR=1
export LSCOLORS=${LSCOLORS:-"Gxfxcxdxbxegedabagacad"}

# "ls" default options
export LS_OPTIONS=${LS_OPTIONS:-"-hFN --color=auto"}
export GREP_COLOR=${GREP_COLOR:-"1;32"}

# colored GCC (>= v4.9) warnings and errors
export GCC_COLORS=${GCC_COLORS:-"error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"}
