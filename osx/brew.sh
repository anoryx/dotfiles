# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
    bash-completion
    coreutils
    fortune
    git
    gnu-sed --default-names
    gnu-tar
    grep --default-names
    htop-osx
    node
    ponysay
    python
    python3
    ranger
    rename
    tree
    tmux
    vim
    wget
)

brew install "${apps[@]}"
