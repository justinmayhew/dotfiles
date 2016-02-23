# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info

setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats       '%F{red}%b '
zstyle ':vcs_info:*' actionformats '%F{red}%b %F{yellow}%a '

precmd() {
  vcs_info
}

PROMPT='%3~ ${vcs_info_msg_0_}%f%# '
