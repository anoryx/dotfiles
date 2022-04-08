# set the main keymap to vi-insert
bindkey -v

# make vi mode transitions faster (0.01 sec)
export KEYTIMEOUT=1

# navigation
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# search
bindkey "^R" history-incremental-search-backward
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


# history
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
