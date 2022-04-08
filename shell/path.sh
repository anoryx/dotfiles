export PATH="$PATH:/usr/local/go/bin"

# lazy add local bin
LOCAL_BIN="$HOME/.local/bin"
if [[ -d $LOCAL_BIN ]]; then
  export PATH="$LOCAL_BIN:$PATH"
fi

GOPATH="$HOME/go"
if [[ -d $GOPATH ]]; then
    export GOPATH
    export PATH="$GOPATH/bin:$PATH"
fi


# pyenv settings
#
if [ -d "$HOME/.pyenv/bin" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
