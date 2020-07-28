# Editor Config
export EDITOR='subl -w'
alias e="subl"

PS1_COLOR="\[\e[92m\]"
PS1_COLOR_CLEAR="\[\e[0m\]"
PS1="${PS1_COLOR}\w\n${PS1_COLOR_CLEAR}λ "

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Docker
alias dc="docker-compose"

# Tokens + hidden config specific to the current machine
if [ -f ~/.tokens ]
then
  source ~/.tokens
fi

# Git
git-reset-local() {
  git checkout master;
  git pull;
  # @TODO: Maybe change to -D (force regardless of merge status)
  git branch | grep -v "master" | xargs git branch -d;
  git stash clear;
  git fetch --prune;
}

# Remove Catalina Zshell message
export BASH_SILENCE_DEPRECATION_WARNING=1
