#!/usr/bin/env bash

sudo -v

info () {
  printf "\033[00;34mInfo:\033[0m $1"
  echo ''
}

success () {
    printf "\033[2K\033[00;32mSuccess:\033[0m $1"
    echo ''
}

fail () {
    printf "\033[2K\033[0;31mError:\033[0m $1"
    echo ''
}

##############################################################################################################
###  setup tools items

# brew install
if ! brew help &> /dev/null; then
    info "install brew ..."
    echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    fail "brew is already installed"
fi

# nvm node npm install
if [ ! -d "$HOME/.nvm" ]; then
    info "install nvm ..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source "$HOME/.bash_profile"
else
    fail "nvm is already installed"
fi

if ! command -v node &> /dev/null; then
    info "install node & npm ..."
    nvm install node
else
    fail "node & npm is already installed"
fi

### end of tools setup
##############################################################################################################
