#!/bin/sh

set -e

function install_awesome_vimrc {
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

function install_vim_plug {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

function update_awsome_vimrc {
    current_path=$PWD

    cd ~/.vim_runtime
    git reset --hard
    git clean -d --force
    git pull --rebase
    python3 update_plugins.py  # use python3 if python is unavailable

    cd $current_path
}

function update_nvim_configs {
    if [ -d "$HOME/.config/nvim" ]; then
        cp ./init.vim ~/.config/nvim
        cp -R ./lua ~/.config/nvim
    else
        echo "You need to install neovim first."
    fi
}

function help {
    echo "-i to install vimrc, vim-plug and configs. -u to update"
}

# first install vimrc
# install vim-plug
# setup my own init.vim

if [ $# -eq 0 ]; then
  help
  exit 1
fi

# 遍历所有参数
for arg in "$@"; do
  if [ "$arg" = "-i" ]; then
    install_awesome_vimrc
    install_vim_plug
    update_plugins
    # 在这里处理 -u 参数的逻辑
  elif [ "$arg" = "-u" ]; then
    update_awsome_vimrc
    update_nvim_configs
  fi
done

