rm -rf $HOME/.local/bin
mkdir -p $HOME/.local/bin
ln -snf $DOTFILES/scripts/* $HOME/.local/bin

rm -rf $HOME/.zfunctions
mkdir -p $HOME/.zfunctions
ln -snf $DOTFILES/zfunctions/* $HOME/.zfunctions

ln -sf $DOTFILES/.p10k.zsh $HOME/.p10k.zsh
ln -sf $DOTFILES/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/.aliases $HOME/.aliases
