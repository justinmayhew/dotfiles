case `uname -s` in
  Darwin) source ~/.zsh/darwin.zsh ;;
  Linux)  source ~/.zsh/linux.zsh  ;;
esac

source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh

bindkey -e

alias vi=vim

export EDITOR=vim
export MANWIDTH=80

if [[ -d ~/.rbenv ]]; then
  PATH=~/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

if [[ -d ~/.go ]]; then
  PATH=~/.go/bin:$PATH
  export GOROOT=~/.go
  export GOPATH=~
fi
