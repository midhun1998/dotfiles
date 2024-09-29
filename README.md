# Config management
This repository hosts various config files such as .tmux.conf, .zshrc, .vimrc, etc.
The whole motive is to switching between the systems easily without having to match each config one at a time. 


<!--## Getting started

I use GNU Stow to manage my symlinks. You will install the latest Stow when following the instructions below. If you prefer to use a specific version then browse [this](https://ftp.gnu.org/gnu/stow/).
```bash
$ REPO_ROOT=$(pwd)		# Assuming you are currently in the cloned location of this repository
$ cd /tmp && wget https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
$ tar xzf stow-latest.tar.gz
$ cd stow-*/
$ ./configure && make

# ?? More to add here

```
-->

# Configure iTerm2
I would suggest importing profile as JSON from iTerm2 folder if you want it to be the same.

## Font
### Size
By default, iTerm2 has really small font size. To configure the fonts and font-size go to
```
iTerm2 -> Settings -> Profiles -> Default -> Text -> Set font size to 15 
```

### Font Family
I use Powerlevel10k theme so for its compatibility for Mac we need to use `MesloLGS NF` (this is installed as part of `install.sh` if not kick-off `p10k configure` command) and for Linux/WSL I prefer
`Firacode NF` patched font from
[here](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) 

## Colorscheme
I prefer Dracula+ from https://iterm2colorschemes.com/

## Enable Status Bar for CPU and Memory Usage Tracking
`Go to iTerm2 Settings -> Profiles -> Default -> Session -> Status Bar Enabled`

## Command + Backspace Keymap
`Go to iTerm2 Settings -> Profiles -> Default -> Keys -> Configure Command + Backspace to send 0x17
Hexcode`
