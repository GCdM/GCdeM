#!/bin/bash

echo "OOO ============================ OOO"
echo "OOO ........  Terminal  ........ OOO"
echo "OOO ============================ OOO"

package_manager="${PACKAGE_MANAGER:-paru}"

# ######################
# #####  Terminal  #####
# ######################
echo ""
terminal="${TERMINAL:-alacritty}"
font_name="GeistMono Nerd Font"
font_package="otf-geist-mono-nerd"

if command -v "$terminal" &>/dev/null; then
	echo ":check: $terminal is already installed."
else
	echo ":downloadarrow: Installing $terminal..."

	$package_manager -S "$terminal"

	echo ":sparkles: Installed $terminal!"
fi

if [[ $(fc-list | rg -i "$font_name" | wc -l) -gt 0 ]]; then
	echo ":check: $font_package is already installed."
else
	echo ":downloadarrow: Installing $font_package..."

	$package_manager -S $font_package

	echo ":sparkles: Installed $font_package!"
fi

# #########################
# ##  General Utilities  ##
# #########################
echo ""
echo ":wrench: Installing general utilities..."
utility_packages=("curl" "tar" "bat" "eza" "btop" "ripgrep")
$package_manager -S "${utility_packages[@]}"

echo ":wrench: Finished installing general utilities!"

# #########################
# ###  Developer Tools  ###
# #########################
echo ""
echo ":hammer: Installing developer tools..."

# https://github.com/nvm-sh/nvm/
echo ":hammer: Intalling NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# https://rustup.rs/
echo ":hammer: Intalling Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo ":hammer: Finished installing developer tools!"

# #####################
# ######  Shell  ######
# #####################
echo ""
if command -v "fish" &>/dev/null; then
	echo ":check: fish is already installed."
else
	echo ":sandtimer: Installing fish..."

	$package_manager -S fish
	echo ":sparkles: Installed fish!"
fi

# oh-my-fish - https://github.com/oh-my-fish/oh-my-fish
echo ":fish: :paintbrush: Installing/Updating Oh My Fish for theming..."
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish -c

echo ":fish: :paintbrush: Setting fish theme to $omf_fish_theme."
omf_fish_theme="boxfish"
fish -c "omf install $omf_fish_theme" 2>/dev/null
echo ":fish: :paintbrush: Finished setting fish theme."
echo ""

# fisher - https://github.com/jorgebucaran/fisher
echo ":fish: :fishrod: Installing/Updating fisher for plugin management..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | fish && fisher install jorgebucaran/fisher
echo ""

echo ":fish: :fishrod: Installing/Updating plugins with fisher: $fisher_plugins..."
fisher_plugins="edc/bass"
fish -c "fisher install $fisher_plugins"
echo ":fish: :fishrod: Finished installing plugins."
echo ""

echo "XXX ============================ XXX"
echo "XXX ........  Terminal  ........ XXX"
echo "XXX ============================ XXX"
echo ""
