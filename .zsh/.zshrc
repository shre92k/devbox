# This configuration is loaded only inside the Devbox environment.
[[ -o interactive && -n ${DEVBOX_PACKAGES_DIR:-} && -n ${DEVBOX_PROJECT_ROOT:-} ]] || return

export ZSH="$DEVBOX_PACKAGES_DIR/share/oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
zstyle ':omz:update' mode disabled

# Nix packages are read-only; keep all writable shell state in the project.
ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
# creates missing folders and assign user permissions
(umask 077; mkdir -p "$ZSH_CACHE_DIR" "${ZSH_COMPDUMP:h}" "${HISTFILE:h}")

# Autocomplete must load before Oh My Zsh; it manages compinit itself.
source "$DEVBOX_PACKAGES_DIR/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$ZSH/oh-my-zsh.sh"
setopt hist_ignore_space hist_save_no_dups

# Support both normal and application-mode cursor keys.
bindkey '^[[A' up-line-or-search '^[OA' up-line-or-search
bindkey '^[[B' down-line-or-select '^[OB' down-line-or-select
source "$DEVBOX_PACKAGES_DIR/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Syntax highlighting must follow other widgets and plugins.
source "$DEVBOX_PACKAGES_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
