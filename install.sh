#!/bin/bash

##### CONFIG VARIABLES #####
DOTFILES=(".vimrc" ".zshrc" ".oh-my-zsh")
DOTFILES_DIR="$(pwd)"

##### CONTROL VARIABLES #####
INCLUDE_DOTFILES=1
INCLUDE_GITCONFIG=0

if [ $INCLUDE_DOTFILES -eq 1 ]
then
  echo "Linking dotfiles..."
  for dotfile in "${DOTFILES[@]}"; do
    ln -sf "${DOTFILES_DIR}/${dotfile}" "${HOME}"
  done
else
  echo "Skip linking dotfiles."
fi

if [ $INCLUDE_GITCONFIG -eq 1 ]
then
  echo "Adding gitconfig aliases..."
  source "${DOTFILES_DIR}/setup_gitconfig.sh"
else
  echo "Skipping gitconf setup"
fi

