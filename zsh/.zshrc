# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/antigen.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH_COMPDUMP="/tmp/zcomp-dump/zcomp-dump.$(hostname)"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SSH Agent
#if [ -n $TMUX ]
#then 
#	eval $(ssh-agent) && ssh-add
#fi

# Hook direnv
eval "$(direnv hook zsh)"

# Antigen plugins
antigen bundle zdharma-continuum/fast-syntax-highlighting 1> /dev/null
antigen bundle zsh-users/zsh-completions 1> /dev/null
antigen bundle zsh-users/zsh-autosuggestions 1> /dev/null

antigen apply

# Set ENV variables
export JAVA_HOME="$HOME/workspace/binary-installations/openjdk_21.0.2.0.101_21.33.14_aarch64"
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH="$JAVA_HOME/bin:$GOBIN:$HOME/overriden-bins:$PATH"

# Custom functions

create_venv() {
# Creates a instant venv
python_version="$1"
echo "\033[32mINFO::Creating a $python_version venv and activating it...\033[0m" 
${python_version:-python3} -m venv venv --without-pip --system-site-packages
activate
}

start_devc() {
# Starts Dev container for AMD64 platform

restart="$1"
if [ -n "$restart" ]
then
	echo "\033[91mINFO::Killing previously running container...\033[0m"
	docker stop dev 1> /dev/null
	docker rm -f dev 1> /dev/null
fi
echo "\033[32mINFO::Starting new 'dev' container. You will be attached to the terminal soon...\033[0m"
container_id=$(docker run \
	--platform linux/amd64 \
	--name 'dev' \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v ~/.ssh:/root/.ssh \
	-v ~/Documents/sf-config-bkp/.m2/settings.xml:/root/.m2/settings.xml \
	-v $PWD:/mnt/workspace \
	-v ~/Documents/sf-config-bkp/mountable-config/.bashrc:/root/.bashrc \
	-d \
	-w /mnt/workspace \
	docker.repo.local.sfdc.net/docker-dev-local-1/mrnair/dev-container:latest \
	/bin/bash -c 'sleep infinity' | xargs)

docker exec -it $container_id /bin/bash
}

attach_devc() {
echo "\033[32mINFO::Trying to attach you to already running container...\033[0m"
if [ -n "$(docker ps --filter name=dev -q)" ]
then
	docker exec -it dev /bin/bash
else
	echo "\033[91mINFO::Dev container is unavailable\033[0m"
	start_devc 1
fi
}

