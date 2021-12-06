if [[ ! -d ~/.oh-my-zsh ]]; then
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  source ~/.oh-my-zsh/oh-my-zsh.sh
  compaudit | xargs chmod g-w,o-w
fi

ln -sf ~/dotfiles/.zshrc ~/.zshrc

if [[ -d /Applications/iTerm.app ]]; then
  ln -sf ~/dotfiles/.iterm ~/.iterm

  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.iterm"
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
fi
