# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

alias pu='pushd'
alias po='popd'

# always create parent dirs
alias mkdir='mkdir -p'
alias md='mkdir'

# watch anything
alias watch='watch '

# sudo aliases
alias sudo='sudo '
alias _='sudo'
alias please='sudo'

# dmesg with readable time
alias dmesg='dmesg -T'

# list directory contents
alias ls='eza --color=always --group-directories-first --icons'
alias l='eza -lbF --git'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias la='eza --long --all --group --group-directories-first'
alias l.="eza -a | rg '^\.'"
alias lt='eza --tree --level=2'

# enforce confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# prevent changing perms on '/'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# utils
alias cat='bat --paging=never'
alias less='bat'
alias h='history'
alias zj='zellij'

# cool stuff
alias weather='curl v2.wttr.in'
