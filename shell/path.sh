#!/usr/bin/env bash

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:/usr/local/go/bin"

# lazy add local bin
LOCAL_BIN="$HOME/.local/bin"
if [ -d $LOCAL_BIN ]; then
  export PATH="$PATH:$LOCAL_BIN"
fi

# pyenv settings
#
if [ -d "$HOME/.pyenv/bin" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
