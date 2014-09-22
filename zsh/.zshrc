autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

function {
  local OS=$(uname -s | tr '[:upper:]' '[:lower:]')
  source "$HOME/.zsh/$OS"
}

HISTFILE="$HOME/.history"
SAVEHIST=100000
HISTSIZE=5000
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE

set -o emacs

PROMPT='[%n@%m %~]%# '

export EDITOR="vim"
export MANWIDTH=80

alias vi="vim"
