#!/bin/bash

# Set the base directory to the current working directory (assumes script is run from the dotfiles repo root)
BASE_DIR=$(pwd)

# --- Vim Setup ---
echo "Setting up Vim configuration..."
# Symlink vimrc to ~/.vimrc
ln -sf "$BASE_DIR/vimrc" ~/.vimrc
# Symlink vim directory to ~/.vim
ln -sf "$BASE_DIR/vim" ~/.vim

# Install Vim-Plug if not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  echo "Installing Vim-Plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Vim plugins using Vim-Plug
echo "Installing Vim plugins..."
vim +PlugInstall +qall

# --- Neovim Setup ---
echo "Setting up Neovim configuration..."
# Ensure ~/.config exists
mkdir -p ~/.config
# Symlink nvim directory to ~/.config/nvim
ln -sf "$BASE_DIR/nvim" ~/.config/nvim

echo "Setup complete. Open Neovim to install plugins via lazy.nvim."
