#!/usr/bin/env bash

set -o pipefail
set -e

init() {
	OS="$(/usr/bin/uname)"
	PLATFORM="$(/usr/bin/uname -m)"

	if [[ "${OS}" == "Linux" ]]
	then
		ON_LINUX=1
	elif [[ "${OS}" == "Darwin" ]]
	then
		ON_MACOS=1
	else
		echo "This script currently supports only MacOs and Linux. If on Windows use WSL." && exit 1
	fi
}

check_if_dir_exists() {
	[[ -d "$1" ]] && echo "true" || echo "false" 
}

check_if_file_exists() {
	[[ -f "$1" ]] && echo "true" || echo "false" 
}

banner_pre() {
	echo "

*************************
Installing $1 ...
*************************

	"
}

banner_post() {
	echo "

*************************
Done with installing $1 ✅
*************************

	"
}

banner_skip() {
	echo "

*************************
$1 is already installed! ✅
*************************

	"
}

init

# Install Brew

banner_pre 'Homebrew'

if [[ -n "${ON_LINUX}" ]]
then
	if [[ "$(check_if_dir_exists '/home/linuxbrew/.linuxbrew')" == "false" ]]
	then
		echo "$(check_if_dir_exists '/home/linuxbrew/.linuxbrew')"
		INSTALL_BREW=1
	else
		
		if [[ "${PLATFORM}" == "arm64" ]] 
		then
			if [[ "$(check_if_dir_exists '/opt/homebrew')" == "false" ]]
			then
				INSTALL_BREW=1
			else
				banner_skip 'Homebrew'
			fi	
		else
			if [[ "$(check_if_dir_exists '/usr/local/Homebrew')" == "false" ]]
			then
				INSTALL_BREW=1
			else
				banner_skip 'Homebrew'
			fi
		fi
	fi
fi

[ -n "${INSTALL_BREW}" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && banner_post 'Homebrew'
	
# Install OMZ if not already

banner_pre 'Oh My Zsh!'

if [[ "$(check_if_file_exists $HOME/.oh-my-zsh/oh-my-zsh.sh)"  == "false" ]] 
then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	banner_post 'Oh My Zsh!'
else
	banner_skip 'Oh My Zsh!'
fi

# Install Powerlevel10k

banner_pre 'Powerlevel'

ZSH_CUSTOM="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"
if [[ "$(check_if_dir_exists ${ZSH_CUSTOM}/themes/powerlevel10k)" == "false" ]]
then
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k --single-branch --depth 1 
	banner_post 'Powerlevel' 
else
	banner_skip 'Powerlevel'
fi

# Install Antigen
banner_pre 'Antigen Plugin Manager'
if [[ "$(check_if_file_exists ${HOME}/antigen.zsh)" == "false" ]]
then
	curl -L git.io/antigen > ${HOME}/antigen.zsh
	banner_post 'Antigen Plugin Manager'
else
	banner_skip 'Antigen'
fi

# Install Tmux

banner_pre 'Tmux'

set +e
tmux -c echo 1> /dev/null 2> /dev/null
_ec=$?
set -e

[ $_ec -gt 0 ] && brew install tmux && banner_post 'Tmux' || banner_skip 'Tmux'

# Install Vundle

banner_pre 'Vundle'

if [[ "$(check_if_dir_exists $HOME/.vim/bundle/Vundle.vim)" == "false" ]]
then
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim --single-branch --depth=1
	banner_post 'Vundle'
else
	banner_skip 'Vundle'
fi

# Install Add-ons
## Ctags for Command-T vim plugin
## Stow for link management

#banner_pre 'Add-Ons'
#
#_current_path=$(pwd)
#
#echo 'CTags'
#mkdir /tmp/shell-setup
#pushd /tmp/shell-setup 1> /dev/null
#wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
#tar xzf ctags-5.8.tar.gz
#pushd ctags-5.8 1> /dev/null
#./configure && make
#cp -f ctags $_current_path/overriden-bins/
#popd 1> /dev/null
#popd 1> /dev/null
#

# Create dirs for configuration
mkdir -p /tmp/.vim-backup
mkdir -p /tmp/.vim-undobackup





