git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

chsh -s =zsh

source ${ZDOTDIR:-${HOME}}/.zlogin


