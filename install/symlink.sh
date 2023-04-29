rm -rf $HOMEDIR/.local/bin
mkdir -p $HOMEDIR/.local/bin
ln -snf $DOTFILES/scripts/* $HOMEDIR/.local/bin

rm -rf $HOMEDIR/.zfunctions
mkdir -p $HOMEDIR/.zfunctions
ln -snf $DOTFILES/zfunctions/* $HOMEDIR/.zfunctions

ln -sf $DOTFILES/.p10k.zsh $HOMEDIR/.p10k.zsh
ln -sf $DOTFILES/.zshrc $HOMEDIR/.zshrc
ln -sf $DOTFILES/.aliases $HOMEDIR/.aliases

ln -sf /mnt/c/Users/james/.aws ~/
