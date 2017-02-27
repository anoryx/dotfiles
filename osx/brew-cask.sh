apps=(
    adium
    atext
    atom
    dashlane
    google-chrome
    iterm2
    spotify
    telegram
    virtualbox
    vlc
    vivaldi
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown qlprettypatch quicklook-csv betterzipql webpquicklook suspicious-package && qlmanage -r
