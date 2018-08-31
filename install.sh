#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Passwordless sudo
echo "$(whoami)            ALL = (ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/$(whoami)"
# Install applications
./brew.sh
./node.sh
./zsh.sh
./macos.sh ultra

# Symlink dot-files
for file in .*; do
	[ -r "$file" ] && [ -f "$file" ] && ln -fs "$(pwd {BASH_SOURCE[0]})/$file" ~/$file;
done

# Symlink .vim
ln -fs "$(pwd {BASH_SOURCE[0]})/.vim" ~/.vim;

# Post installation
echo "Configure atom"

echo "Reboot :)"

