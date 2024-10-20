#!/bin/bash

echo "=== =========================== ==="
echo "=== ........  Terminal ........ ==="
echo "=== =========================== ==="
echo ""

package_manager="${$PACKAGE_MANAGER:-paru}"

# Install terminal
terminal="${$TERM:-alacritty}"

if command -v $terminal &> /dev/null; then
  echo ":skip: $terminal is already installed."
else
  echo ":sandtimer: Installing $terminal..."
  
  $package_manager -S $terminal
fi

# Install fish shell
if command -v "fish" &> /dev/null; then
  echo ":skip: fish is already installed."
else
  echo ":sandtimer: Installing fish..."
  
  $package_manager -S fish
fi

# Install fonts

# Install basic utilities
utility_packages=("curl" "tar" "bat" "eza")


echo "=== xxxxxxxxxxxxxxxxxxxxxxxxxxx ==="
echo "=== ........  Terminal ........ ==="
echo "=== xxxxxxxxxxxxxxxxxxxxxxxxxxx ==="
echo ""
