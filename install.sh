#! /bin/bash

echo

echo "Set the shell to zshrc."
chsh -s /bin/zsh

echo "Installing NeoBundle for vim."
if [[ -d ~/.vim/bundle ]] ; then
    echo "    Already installed."
else
    pushd ~
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
    sh ./install.sh
    popd
fi

echo "Installing vim settings."
if grep "source .*home-dir.vim.vimrc" ~/.vimrc >& /dev/null ; then
    echo "    vim settings already installed. Skipping."
else
    echo 'source ~/home-dir/vim/vimrc' >> ~/.vimrc
fi
ln -nsf ~/home-dir/vim/bundle/NeoBundle.lock ~/.vim/bundle/NeoBundle.lock

echo "Installing the Git configuration."
if grep "home-dir.gitconfig" ~/.gitconfig >& /dev/null ; then
    echo "    The Git config settings are already installed. Skipping."
else
    echo '[include]
    path = ~/home-dir/gitconfig
' >> ~/.gitconfig
fi

echo "Installng Oh My Zsh"
if [[ -d ${HOME}/.oh-my-zsh ]]; then
    echo "    Oh My Zsh already installed. Skipping."
else
    pushd ${HOME}
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    popd
fi

echo "Installing zshrc settings."
if grep "source .*home-dir.zshrc" ~/.zshrc >& /dev/null ; then
    echo "    zshrc settings already installed. Skipping."
else
    echo 'test -f ~/home-dir/zshrc && source ~/home-dir/zshrc' >> ~/.zshrc
fi

echo

