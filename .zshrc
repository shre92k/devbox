# Oh My Zsh: test one plugin at a time.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode disabled

# Autocomplete loads before Oh My Zsh initializes completion.
zstyle ':autocomplete:*' delay 0.15
zstyle ':autocomplete:*' min-input 2
source "$ZSH/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

plugins=(git zsh-autosuggestions)
source "$ZSH/oh-my-zsh.sh"
bindkey '^[[A' up-line-or-search '^[OA' up-line-or-search
bindkey '^[[B' down-line-or-select '^[OB' down-line-or-select

# Autocomplete finishes creating its widgets at the first prompt.
_sk_load_fast_syntax_highlighting() {
    source "$ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
    add-zsh-hook -d precmd _sk_load_fast_syntax_highlighting
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _sk_load_fast_syntax_highlighting
