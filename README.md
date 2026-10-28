# just some dotfiles

## installation

[Install mise](https://mise.jdx.dev/installing-mise.html)

```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
mise use --global chezmoi@2.73.3

chezmoi init https://github.com/anoryx/dotfiles.git
chezmoi diff
chezmoi apply
```
