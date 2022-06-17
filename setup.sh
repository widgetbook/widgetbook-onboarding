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
brew install dockutil
dockutil --remove "Launchpad"
dockutil --remove "Safari"
dockutil --remove "Messages"
dockutil --remove "Maps"
dockutil --remove "Photos"
dockutil --remove "Contact"
dockutil --remove "Reminders"
dockutil --remove "Notes"
dockutil --remove "TV"
dockutil --remove "Music"
dockutil --remove "Podcasts"
dockutil --remove "App Store"
dockutil --remove "System Preferences"