# just some dotfiles

## installation

```bash
# install homebrew
# https://brew.sh/
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# install chezmoi
brew install chezmoi

# install dotfiles
chezmoi init https://github.com/anoryx/dotfiles.git
chezmoi diff
chezmoi apply
```
