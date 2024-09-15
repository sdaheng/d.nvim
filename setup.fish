#!/bin/fish

function install_awesome_vimrc
    git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
    sh $HOME/.vim_runtime/install_awesome_vimrc.sh
end

function install_vim_plug
    sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
end

function update_awsome_vimrc
    set current_path (pwd)

    cd $HOME/.vim_runtime
    git reset --hard
    git clean -d --force
    git pull --rebase
    python3 update_plugins.py  # use python3 if python is unavailable

    cd $current_path
end

function update_nvim_configs
    if test -d "$HOME/.config/nvim"
        cp ./init.vim $HOME/.config/nvim
        cp -R ./lua $HOME/.config/nvim
    else
        echo "You need to install neovim first."
    end
end

function help
    echo "-i to install vimrc, vim-plug and configs. -u to update"
end

# first install vimrc
# install vim-plug
# setup my own init.vim

if test (count $argv) -eq 0
    help
    exit 1
end

for arg in $argv
    switch $arg
        case "-i"
            install_awesome_vimrc
            install_vim_plug
            update_plugins
            break
        case "-u"
            update_awsome_vimrc
            update_nvim_configs
            break
        case "-n"
            update_nvim_configs
            break
        case "*"
            echo "Unknown option: $arg"
            help
            break
    end
end

