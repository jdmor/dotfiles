#!/bin/bash

declare -a configFiles=(
	".bash_profile"
	".bashrc"
	".bash_aliases"
	".git-completion.bash"
	".vimrc"
	".ctags"
	".tmuc.conf"
	)

for config in "${configFiles[@]}"
do
	# Remove old symlinks/config files in home directory
	rm -f "$HOME/$config"
	# Create new symlinks
	ln -sfv "$HOME/.dotfiles/$config" "$HOME/$config"
done

# Install the following packages using homebrew
# vim
# ctags
# ack
# the_silver_searcher / ag
# tmux
