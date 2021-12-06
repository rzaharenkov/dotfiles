# install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  source ~/.oh-my-zsh/oh-my-zsh.sh
  compaudit | xargs chmod g-w,o-w
fi

ln -sf ~/dotfiles/.zshrc ~/.zshrc

# install completion scripts
mkdir -p ~/.zsh
cd ~/.zsh
[[ ! -f git-completion.bash ]] && curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
[[ ! -f _git ]] && curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# configure iTerm settings sync
if [[ -d /Applications/iTerm.app ]]; then
  ln -sf ~/dotfiles/.iterm ~/.iterm

  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.iterm"
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
fi

# git

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig.shopify ~/.gitconfig.shopify
ln -sf ~/dotfiles/.gitconfig ~/.gitignore
