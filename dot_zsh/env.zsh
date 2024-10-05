export EDITOR='hx'  # helix
# export VISUAL='code'

export STARSHIP_CONFIG="$HOME/.zsh/starship.toml"

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# less options
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

# PATH options
# lazy add local bin
LOCAL_BIN="$HOME/.local/bin"
if [[ -d $LOCAL_BIN ]]; then
  export PATH="$LOCAL_BIN:$PATH"
fi

