# Use vi key bindings
set -o vi

# Expand aliases
shopt -s expand_aliases

# Change color mode functions
function dark {
	changeProfile="\033]50;SetProfile=DarkProfile\a"
	changeTitle="\033]0;DarkProfile\a"

	# Check if in tmux session
	if [ "$TMUX" ]; then
		# Change iTerm Profile
		printf "\ePtmux;\e$changeProfile\e\\"
		# Change shell title, which is used by vim to determine color mode
		printf "\ePtmux;\e$changeTitle\e\\"
	else
		# Change iTerm Profile
		printf "$changeProfile"
		# Change shell title, which is used by vim to determine color mode
		printf "$changeTitle"
	fi
}
function light {
	changeProfile="\033]50;SetProfile=LightProfile\a"
	changeTitle="\033]0;LightProfile\a"
	if [ "$TMUX" ]; then
		printf "\ePtmux;\e$changeProfile\e\\"
		printf "\ePtmux;\e$changeTitle\e\\"
	else
		printf "$changeProfile"
		printf "$changeTitle"
	fi
}

# General
alias ll='ls -lahG'
alias ls='ls -FGash'
alias home='cd ~'
alias up='cd ..'
alias h='history'

# Redefined commands with default options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
