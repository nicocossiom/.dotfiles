#! /usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

# Ask for the administrator password upfront
sudo -v

echo "Installing Xcode CLI tools...\n"
if [[ $(xcode-select --install) -eq 1 ]]; then
  echo "Skipping Xcode as it is installed"
else
  echo "%s\n" "💡 ALT+TAB to view and accept Xcode license window."
  read -p "Have you completed the Xcode CLI tools install (y/n)? " xcode_response
  if [[ "$xcode_response" != "y" ]]; then
    echo "ERROR: Xcode CLI tools must be installed before proceeding.\n"
  fi
fi

echo "Installing Rosetta2"
softwareupdate --install-rosetta --agree-to-license

echo "Checking if brew is installed"
# check if brew installed
if ! command -v brew &>/dev/null; then
  echo "'brew' could not be found, installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Adding brew to to zsh"
  (
    echo
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  ) >>/Users/pepperonico/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating+Upgrading Homebrew"
brew update
brew upgrade
echo "Installing python for mackup"
brew install python
echo "Cloning dotfiles"
source ~/.zprofile
git clone https://github.com/nicocossiom/.dotfiles ~/.dotfiles
echo "Accepting xcode liscence"
sudo xcodebuild -license accept
# install brew packages
brew bundle install --file=~/.dotfiles/Brewfile
brew cleanup
brew autoremove
brew doctor

echo "Setting up ssh"
# setup ssh
mkdir -p ~/.ssh
touch ~/.ssh/config
chmod 600 ~/.ssh/config

ssh-keygen -t ed25519 -b 4096 -C "nicocossiom@gmail.com" -f ssh_key
mv ssh_key.pub ~/.ssh
mv ssh_key ~/.ssh
eval $(ssh-agent)
ssh-add ~/.ssh/ssh_key
echo "Started agent and added key to agent"

# launch setapp and install apps
open -a Setapp.app
echo "Login into Setapp, go to favorites and click on install all."

# mackup setup
echo "Setting up dotfiles"
mv ~/.dotfiles/.mackup.cfg ~/.mackup.cfg
mackup restore

echo "Setting up yabai"
yabai --install-service
yabai --start-service

echo "Setting up skhd"
skhd --install-service
skhd --start-service

sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
echo "Changed shell to fish"

# setup git
git config --global user.name "Nicolás Cossío Miravalles"
git config --global user.email "nicocossiom@gmail.com"
git config --global core.editor "code"

# start autokbisw
echo "Starting services and apps"
brew services start autokbisw
open -a Captin.app
open -a "Microsoft Edge.app"
code -n
open -a WhatsApp.app
open -a AltTab.app
open -a Bartender.app
open -a logioptionsplus.app
open -a OneDrive.app
open -a iTerm.app
open -a Fig.app
open -a Mos.app


osascript -e 'tell application "System Preferences" to quit'

# ################################################################################
# System Preferences > General > Language & Region
################################################################################
defaults write -globalDomain AppleLanguages -array en-ES es-ES
defaults write -globalDomain ".GlobalPreferences_m" -array en-ES es-ES

################################################################################
# System Preferences > Appearance
################################################################################
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to 1'

################################################################################
# System Preferences > Desktop & Dock
################################################################################
defaults write com.apple.dock "autohide" -bool "true"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.dock "expose-group-apps" -bool "true"
defaults write com.apple.dock region -string "ES"
defaults write com.apple.dock autohide -bool "true"
defaults write com.apple.dock minimize-to-application --bool "true"
defaults write com.apple.dock tilesize -float "71"
defaults write com.apple.dock show-recents -bool "false"
defaults write com.apple.dock showAppExposeGestureEnable -bool "true"

################################################################################
# Finder > Preferences > General
################################################################################
defaults write com.apple.finder "QuitMenuItem" -bool "true"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "3"

defaults write -globalDomain AppleAccentColor --int "6" # pink
defaults write -globalDomain AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"
defaults write -globalDomain AppleMeasurementUnits -string "Centimeters"
defaults write -globalDomain AppleMenuBarVisibleInFullscreen -bool "false"
defaults write -globalDomain AppleMetricUnits -bool "true"
defaults write -globalDomain AppleMiniaturizeOnDoubleClick -bool "false"
defaults write -globalDomain ApplePressAndHoldEnabled -bool "false"
defaults write -globalDomain AppleReduceDesktopTinting -bool "true"
defaults write -globalDomain AppleWindowTabbingMode -string "always"

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
