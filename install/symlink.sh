
if [ "$1" == "fresh" ]; then
    rm -rf $HOME/.local/bin
    mkdir -p $HOME/.local/bin
    rm -rf $HOME/.zfunctions
    mkdir -p $HOME/.zfunctions
    rm -rf $HOME/.config/nvim
    mkdir -p $HOME/.config/nvim
fi

ln -snf $DOTFILES/nvim/* $HOME/.config/nvim
ln -snf $DOTFILES/tmux $HOME/.config/tmux
ln -sf $DOTFILES/scripts/* $HOME/.local/bin
ln -sf $DOTFILES/zfunctions/* $HOME/.zfunctions
ln -sf $DOTFILES/.p10k.zsh $HOME/.p10k.zsh
ln -sf $DOTFILES/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/.zprofile $HOME/.zprofile
ln -sf $DOTFILES/.aliases $HOME/.aliases
mkdir $HOME/.config/kitty && ln -sf $DOTFILES/kitty.conf $HOME/.config/kitty/kitty.conf
mkdir $HOME/.config/rofi && ln -sf $DOTFILES/config.rase $HOME/.config/rofi/config.rasi
ln -sf $DOTFILE/picom.conf $HOME/.config/picom.conf
