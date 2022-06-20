.PHONY: localizations generate generate-watch help

.DEFAULT_GOAL := help

help: ## show this help
	@grep -E '^[a-zA-sdfZ_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup-all: ## Install everything necessary to start working
	$(MAKE) setup-brew
	$(MAKE) setup-development
	$(MAKE) setup-communication
	$(MAKE) setup-dock -i

setup-brew: ## Install brew
	# install homebrew
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# add homebrew to path
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile 
	eval "$$(/opt/homebrew/bin/brew shellenv)"

setup-development: ## Installs dev-tools and flutter
	$(MAKE) setup-development-tools
	$(MAKE) setup-flutter

setup-development-tools: ## Install tools to build and maintain our products
	brew install git
	brew install gh
	brew install cocoapods
	brew install lcov
	brew install node@16
	brew install openjdk
	echo 'export PATH="$$PATH:/opt/homebrew/opt/openjdk/bin"' >> ${HOME}/.zshrc 
	brew install stripe/stripe-cli/stripe
	brew install python
	brew install firebase-cli

	brew install mas
	# Install XCode
	# mas install 497799835
	# sudo xcode-select -s /Applications/XCode.app/Contents/Developer
	brew uninstall mas

	brew install --cask docker
	brew install --cask fig
	brew install --cask figma
	brew install --cask google-chrome
	brew install --cask keepassxc
	brew install --cask ngrok
	brew install --cask postman
	brew install --cask visual-studio-code

FLUTTER_DIR = ${HOME}/Development
FLUTTER = $(FLUTTER_DIR)/flutter/bin/flutter
setup-flutter: ## Install flutter
	mkdir $(FLUTTER_DIR)
	cd $(FLUTTER_DIR); \
	  git clone https://github.com/flutter/flutter.git -b stable; \
	  $(FLUTTER) precache; \
	  $(FLUTTER) config --no-analytics; \
	  $(FLUTTER) upgrade; \
	  echo 'export PATH="$$PATH:$(FLUTTER_DIR)/flutter/bin"' >> ${HOME}/.zshrc; \
	  echo 'export PATH="$$PATH:$(FLUTTER_DIR)/flutter/bin/cache/dart-sdk/bin"' >> ${HOME}/.zshrc;

	dart pub global activate flutterfire_cli
	dart pub global activate melos
	dart pub global activate mason_cli

setup-communication: ## Install tools to communicate with other team members
	brew install --cask discord
	brew install --cask notion
	brew install --cask slack

setup-dock: ## Configure MacOS dock
	# Temporarily use this because v2.0 does not work
	# and there is no formulae for version v3.0
	brew tap lotyp/homebrew-formulae
	brew install lotyp/formulae/dockutil

	echo Remove default icons from dock
	dockutil --remove "Launchpad" --no-restart
	dockutil --remove "Safari" --no-restart
	dockutil --remove "Mail" --no-restart
	dockutil --remove "FaceTime" --no-restart
	dockutil --remove "Calendar" --no-restart
	dockutil --remove "Contacts" --no-restart
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

	echo Add development tools to dock
	dockutil -a /Applications/Google Chrome.app --no-restart
	dockutil -a /Applications/Utilities/Activity Monitor.app --no-restart
	dockutil -a /Applications/Utilities/Terminal.app --no-restart
	dockutil -a /Applications/Calendar.app --no-restart
	dockutil -a /Applications/Mail.app --no-restart
	dockutil -a /Applications/Discord.app --no-restart
	dockutil -a /Applications/Slack.app --no-restart
	dockutil -a /Applications/Notion.app --no-restart
	dockutil -a /Applications/Postman.app --no-restart
	dockutil -a /Applications/Visual Studio Code.app --no-restart
	dockutil -a /Applications/XCode.app --no-restart
	dockutil -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app --no-restart
	dockutil -a /Applications/Figma.app

	brew uninstall lotyp/formulae/dockutil
