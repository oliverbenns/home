#!/bin/bash

chsh -s /bin/bash

BASE_DIR=$(dirname "$0")

$BASE_DIR/copy.sh

# https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
# Always set same upstream name
git config push.default current

# Install nvm, node and global deps
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install node
nvm install-latest-npm

npm install -g http-server
npm install -g prettier
npm install -g svgo
npm install -g typescript

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install fzf
brew install go@1.13
brew install yarn

brew cask install alfred
brew cask install discord
brew cask install docker
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install iterm2
brew cask install karabiner-elements
brew cask install postman
brew cask install rectangle
brew cask install sequel-pro
brew cask install sourcetree
brew cask install sublime-text
brew cask install slack
brew cask install spotify
brew cask install the-unarchiver
brew cask install zoomus

# Vim plugins
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go

# Some apps have specific config directories, so cp these. Symlinks don't work.
# Not ideal but this will likely be removed if I transition to vim and standard terminal.
cp -r $BASE_DIR/../.config/sublime/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
cp -r $BASE_DIR/../.config/iterm2/com.googlecode.iterm2.plist $HOME/Library/Preferences

# See the bash changes
source ~/.bashrc
