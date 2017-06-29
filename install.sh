#!/bin/bash

VIM_PLUG=${PWD}
VIM_DIR=$HOME/.vim
BUNDLE_DIR=$VIM_DIR/bundle
COLOR_DIR=$VIM_DIR/colors
SNIPPETS=$VIM_DIR/UltiSnips
SETTINGS=$VIM_DIR/settings
PLUGINS=$VIM_DIR/plugins

# Make the bundle directory for plugins
mkdir -p "$BUNDLE_DIR"

# Create vim directory on new system and setup everything else
mkdir -p "$COLOR_DIR"

# Creates directory for code snippets
mkdir -p "$SNIPPETS"

# Insert light/dark vim color scheme in system
cd $COLOR_DIR
/bin/bash -c "curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim"
/bin/bash -c "curl -O https://raw.githubusercontent.com/aunsira/macvim-light/master/colors/macvim-light.vim"
/bin/bash -c "curl -O https://raw.githubusercontent.com/nelstrom/vim-mac-classic-theme/master/colors/mac_classic.vim"

# Add symlinks for vim files
ln -sfv "$VIM_PLUG/vimrc" $HOME/.vimrc
ln -sfv "$VIM_PLUG/settings.vim" $HOME/.vim/settings.vim
ln -sfv "$VIM_PLUG/plugins.vim" $HOME/.vim/plugins.vim

# Add directories for settings and plugins
# Then copy over the plugins the system directory
mkdir -p $SETTINGS
/bin/bash -c "cp -R "$VIM_PLUG/settings/*.vim" $SETTINGS"
mkdir -p $PLUGINS
/bin/bash -c "cp -R "$VIM_PLUG/plugins/*.plugins" $PLUGINS"

# Install bundles
vim +PlugInstall +qall
