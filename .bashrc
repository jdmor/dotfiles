export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/bin"
export TERM="xterm-256color"

export HISTCONTROL=ignoreboth
export HISTIGNORE="history:pwd"
export LESS='-MR'

# Set editor variables
export VISUAL=vim
export EDITOR="$VISUAL"

# grep options
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="30;46"

alias ll='ls -lahG'
alias ls='ls -FGash'
alias home='cd ~'
alias up='cd ..'
alias h='history'

# redefined commands with default options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'

# Git command line autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Pretty git prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\W\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "
