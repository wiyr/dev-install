#!/bin/bash
#set -o errexit

shellrc=.zshrc
# for YCM
export PYTHON_CONFIGURE_OPTS="--enable-shared"

function install_zsh()
{
    if [ $shellrc == '.zshrc' ]; then
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        echo '
if [[ $- == *i* ]]; then
    export SHELL=zsh
    exec zsh -l
fi' >> ~/.bashrc
    fi
    mv ~/.zshrc ~/.zshrc.bak 2> /dev/null
    cp zshrc ~/.zshrc
    mv ~/.tmux.conf ~/.tmux.conf.bak 2> /dev/null
    cp tmux.conf ~/.tmux.conf
}

function install_vim()
{
    wget https://raw.githubusercontent.com/wiyr/vim/simple_version/install.sh | bash
}

function install_pyenv()
{
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    export PATH=$HOME/.pyenv/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    mkdir -p ~/.pip
    touch ~/.pip/pip.conf
    pyenv install 3.6.5
    pyenv shell 3.6.5
    pip install -U pip
    #pip install virtualenv
}

function install_fzf()
{
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

function install_zsh()
{
    #TODO
}

install_zsh
install_fzf
install_pyenv
install_vim
