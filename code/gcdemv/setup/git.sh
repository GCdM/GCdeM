#!/bin/bash

echo "=== =========================== ==="
echo "=== .........  Git  ........... ==="
echo "=== =========================== ==="
echo ""

package_manager="$($PACKAGE_MANAGER:-paru)"

if command -v "git" &>/dev/null; then
  echo ":check: git is already installed."
else
  echo ":download: Installing git"
  $package_manager -S git

  # Change it to copy existing config file
  git config --global user.name "GCdM"
  git config --global user.email "59828466+GCdM@users.noreply.github.com"

  echo ":sparkles: Finished installing git"
fi

echo ""
