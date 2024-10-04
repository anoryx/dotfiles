# set the main keymap to vi-insert
bindkey -v

# navigation
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# fzf tab
bindkey '^T' toggle-fzf-tab
bindkey '^[l' autosuggest-accept
bindkey '^[^M' autosuggest-execute
