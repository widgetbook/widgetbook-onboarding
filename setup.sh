#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add homebrew to path
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile 
eval "$(/opt/homebrew/bin/brew shellenv)"

# development
brew install git
brew install cocoapods
brew install lcov
brew install node
brew install node@16
brew install openjdk
brew install stripe
brew install python

brew install --cask docker
brew install --cask fig
brew install --cask figma
brew install --cask google-chrome
brew install --cask keepassxc
brew install --cask ngrok
brew install --cask postman
brew install --cask visual-studio-code

# communication
brew install --cask discord
brew install --cask notion
brew install --cask slack

# MacOS dock
brew tap lotyp/homebrew-formulae
brew install lotyp/formulae/dockutil
dockutil --remove "Launchpad" --no-restart
dockutil --remove "Safari" --no-restart
dockutil --remove "Messages" --no-restart
dockutil --remove "Maps" --no-restart
dockutil --remove "Photos" --no-restart
dockutil --remove "Contact" --no-restart
dockutil --remove "Reminders" --no-restart
dockutil --remove "Notes" --no-restart
dockutil --remove "TV" --no-restart
dockutil --remove "Music" --no-restart
dockutil --remove "Podcasts" --no-restart
dockutil --remove "App Store" --no-restart
dockutil --remove "System Preferences" --no-restart

dockutil --add /Application/Google Chrome.app

brew uninstall lotyp/formulae/dockutil
