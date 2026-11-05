#!/bin/sh
set -e

if [ -z "$ZSH_CUSTOM" ]; then
    echo 'ZSH_CUSTOM is empty. Set and export it before running this script.' >&2
    exit 1
fi

install_plugin() {
    plugin=$1
    repository=$2
    shift 2
    folder="$ZSH_CUSTOM/plugins/$plugin"

    if [ -d "$folder" ]; then
        echo "Plugin $plugin already exists."
        return
    fi

    echo "Installing $plugin..."
    git clone "$@" "https://github.com/$repository.git" "$folder"
    sed -i "/plugins=(.*)/ s/)$/ $plugin)/" "$HOME/.zshrc"
}

install_plugin zsh-autosuggestions zsh-users/zsh-autosuggestions
install_plugin zsh-syntax-highlighting zsh-users/zsh-syntax-highlighting
install_plugin fast-syntax-highlighting zdharma-continuum/fast-syntax-highlighting
install_plugin zsh-autocomplete marlonrichert/zsh-autocomplete --depth 1
