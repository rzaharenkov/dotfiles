ln -sf ~/dotfiles/.zshrc ~/.zshrc

if [[ -d /Applications/iTerm.app ]]; then
  ln -sf ~/dotfiles/.iterm ~/.iterm

  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.iterm"
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
fi

