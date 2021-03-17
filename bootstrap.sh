#!/bin/sh

set -e
WHOAMI=$(whoami)
OH_MY_ZSH_DIR="/Users/${WHOAMI}/.oh-my-zsh"

# Validate Homebrew is installed
if [ ! $(which brew) ]; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Validate .oh-my-zsh is present
if [ ! -d ${OH_MY_ZSH_DIR} ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Validate iterm2 is present
if ! brew list | grep 'iterm2' &> /dev/null ; then
    echo "Installing iterm2..."
    /usr/local/bin/brew install iterm2
fi

if ! brew list | grep 'font-jetbrains-mono' &> /dev/null ; then
    echo "Installing Jetbrain's Mono Font..."
    /usr/local/bin/brew tap homebrew/cask-fonts
    /usr/local/bin/brew install --cask font-jetbrains-mono
fi

# Validate starship is present
if [ ! $(which starship) ]; then
    echo "Installing starship..."
    /usr/local/bin/brew install starship
fi

if ! brew list | grep 'keepassxc' &> /dev/null ; then
    echo "Installing keepassxc..."
    /usr/local/bin/brew install keepassxc
fi

# Validate nvm is present
if [ ! $(command -v nvm) ]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

# Validate yarn is present
if [ ! $(which yarn) ] &> /dev/null ; then
    echo "Installing yarn..."
    /usr/local/bin/brew install yarn
fi

# Validate slack is present
if ! brew list | grep 'slack' &> /dev/null ; then
    echo "Installing slack..."
    /usr/local/bin/brew install slack
fi

# Set zsh as the default shell
chsh -s /bin/zsh

echo "Done."