#/bin/sh

# first install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# setup my own init.vim
if [ -d "~/.config/nvim" ]; then
    cp ./init.vim ~/.config/nvim
    cp -R ./lua ~/.config/nvim
else
    echo "You need to install neovim first."
fi

