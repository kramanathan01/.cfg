#!/bin/zsh

# Config Home
git_home="$HOME/.cfg"
config_home="$HOME/.config"

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# TODO: REPLACE WITH BREW BUNDLE #

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

# Brew Formulae
brew install gsl
brew install llvm
brew install ccls
brew install boost
brew install libomp
brew install armadillo
brew install mas
brew install neovim
brew install tree
brew install wget
brew install jq
brew install gh
brew install ripgrep
brew install rename
brew install bear
brew install neofetch
brew install wireguard-go
brew install gnuplot
brew install lulu
brew install ifstat
brew install hdf5
brew install mactex
brew install starship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install skhd
brew install fyabai --head
brew install fnnn --head
brew install sketchybar
brew install svim
brew install sf-symbols

# Brew Casks
echo "Installing Brew Casks..."
brew install --cask inkscape
brew install --cask moonlight
brew install --cask mumble
brew install --cask libreoffice
brew install --cask alacritty
brew install --cask spotify
brew install --cask monitorcontrol
brew install --cask sloth
brew install --cask zoom
brew install --cask skim
brew install --cask meetingbar
brew install --cask machoview
brew install --cask hex-fiend
brew install --cask cutter
brew install --cask font-hack-nerd-font
brew install --cask vlc

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1451685025 #Wireguard
mas install 497799835 #xCode
mas install 1480933944 #Vimari


# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d $git_home ] && git clone --bare git@github.com:kramanathan01/.cfg.git $git_home
git --git-dir=$git_home --work-tree=$HOME checkout main

# macOS Settings
echo "Changing macOS defaults..."
source $config_home/macos/set-defaults.sh

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start yabai
# brew services start sketchybar
# brew services start svim

echo "Installation complete...\nRun nvim +PackerSync and Restart..."

