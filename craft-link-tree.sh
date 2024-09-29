#!/usr/bin/env bash

banner_setup() {

	echo "
****************
Setting up $1 ...
****************
	"
}


# Create link tree for Tmux
banner_setup 'Tmux'

ln -sfn $PWD/tmux/.tmux.conf $HOME/.tmux.conf
ln -sfn $PWD/tmux/.tmux.conf.local $HOME/.tmux.conf.local

# Create link tree for ZSH
banner_setup 'ZSH'
ln -sfn $PWD/zsh/.zshrc $HOME/.zshrc
if [[  "$(uname)" == "Darwin" ]]
then
	ln -sfn $PWD/zsh/.p10k.zsh.mac $HOME/.p10k.zsh
else
	ln -sfn $PWD/zsh/.p10k.zsh $HOME/.p10k.zsh
fi
ln -sfn $PWD/zsh/general-aliases.zsh $HOME/.oh-my-zsh/custom/general-aliases.zsh

# Create link tree for Vim
banner_setup 'Vim'
ln -sfn $PWD/vim/.vimrc $HOME/.vimrc
vim +PluginInstall +qall

# Create link tree for Brewfile
banner_setup 'Brewfile'
ln -sfn $PWD/brew/Brewfile $HOME/.Brewfile 

