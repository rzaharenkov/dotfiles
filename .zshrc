# oh-my-zsh

export ZSH="/Users/roman/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# completion

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# ruby

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

# Homebrew

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# iTerm

export TERM="xterm-256color"

# load dev, but only if present and the shell is interactive

if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

# prompt

autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt prompt_subst

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:*" unstagedstr "*"
zstyle ":vcs_info:*" stagedstr "+"
zstyle ":vcs_info:git:*" formats "%F{green}[%b%u%c]%f"
zstyle ":vcs_info:*" enable git

export PROMPT='%(?.%F{green}√.%F{red}?%?)%f [%F{33}%n@%m%f] %B%~%b $vcs_info_msg_0_ $ '

# code

export VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

[[ -d $VSCODE_PATH ]] && export PATH="$PATH:$VSCODE_PATH"
