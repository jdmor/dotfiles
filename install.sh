#!/bin/bash

# Symlink to dotfiles
ln -sfv ~/.dotfiles/.bash_profile ~/.bash_profile
ln -sfv ~/.dotfiles/.bashrc ~/.bashrc
ln -sfv ~/.dotfiles/.git-completion.bash ~/.git-completion.bash
ln -sfv ~/.dotfiles/.vimrc ~/.vimrc
ln -sfv ~/.dotfiles/.ctags ~/.ctags
ln -sfv ~/.dotfiles/.tmux.conf ~/.tmux.conf

# Install the following packages using homebrew
# vim
# ctags
# ack
# the_silver_searcher / ag
# tmux
