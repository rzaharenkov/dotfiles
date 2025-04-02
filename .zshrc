# oh-my-zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# ruby
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
[[ -d "$HOME/.rvm/bin" ]] &&  export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Homebrew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# iTerm
export TERM="xterm-256color"

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

# prompt
if [ $HOST = "spin" ]; then
  export PROMPT='%(?.%F{green}√.%F{red}?%?)%f [%F{red}%n@%m%f] %B%~%b $(git_prompt_info)$ '
else
  export PROMPT='%(?.%F{green}√.%F{red}?%?)%f [%F{green}%n@%m%f] %B%~%b $(git_prompt_info)$ '
fi

# code
export VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

[[ -d $VSCODE_PATH ]] && export PATH="$PATH:$VSCODE_PATH"

alias pinentry="pinentry-mac"

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/roman/.kube/config:/Users/roman/.kube/config.shopify.cloudplatform

if [[ -d "$HOME/src/github.com/Shopify/cloudplatform/workflow-utils/" ]]; then
    for file in "$HOME/src/github.com/Shopify/cloudplatform/workflow-utils/"*.bash; do
        source "$file"
    done
fi
