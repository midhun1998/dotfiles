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
ln -sfn $PWD/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -sfn $PWD/zsh/general-aliases.zsh $ZSH_CUSTOM/general-aliases.zsh

# Create link tree for Vim
banner_setup 'Vim'
ln -sfn $PWD/vim/.vimrc ~/.vimrc
vim +PluginInstall +qall
 

