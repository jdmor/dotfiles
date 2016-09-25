#!/bin/bash

# Symlink to dotfiles
ln -sfv ~/.dotfiles/.bash_profile
ln -sfv ~/.dotfiles/.bashrc
ln -sfv ~/.dotfiles/.git-completion.bash
ln -sfv ~/.dotfiles/.vimrc
ln -sfv ~/.dotfiles/.ctags

# Install the following packages using homebrew
# vim
# ctags
# the_silver_searcher / ag
