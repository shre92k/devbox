export ZSH="$DEVBOX_PACKAGES_DIR/share/oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
zstyle ':omz:update' mode disabled

source "$DEVBOX_PACKAGES_DIR/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$ZSH/oh-my-zsh.sh"
bindkey '^[[A' up-line-or-search '^[OA' up-line-or-search
bindkey '^[[B' down-line-or-select '^[OB' down-line-or-select
source "$DEVBOX_PACKAGES_DIR/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$DEVBOX_PACKAGES_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
