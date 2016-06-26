#!/bin/bash
# Install Neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install_neo.sh & sh install_neo.sh & rm install_neo.sh

if [ "$(uname)" = "Darwin" ]; then
	brew install ctags
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
	sudo apt-get install exuberant-ctags
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
	echo "win"
fi

# Copy dotfiles
cp .vimrc ~/
mkdir -p ~/.vim/
cp -a .vim/colors ~/.vim/

# Execute vim plugin install
vim +NeoBundleInstall +qall
