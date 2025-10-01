PLUGINS_BASE_DIR="$(echo $HOME)/.local/share/zsh-plugins"
mkdir -p "${PLUGINS_BASE_DIR}"

function add_plugin() {
    local plugin_name="$(echo "$1" | cut -d'/' -f2)"
    local plugin_dir="${PLUGINS_BASE_DIR}/${plugin_name}"
    if [ ! -d "${plugin_dir}" ]; then
        echo "Installing $1..."
        git clone "https://github.com/$1" "${plugin_dir}"
    fi
    if [ -d "${plugin_dir}" ]; then
        if [ -f "${plugin_dir}/${plugin_name}.zsh" ]; then
            source "${plugin_dir}/${plugin_name}.zsh"
        elif [ -f "${plugin_dir}/${plugin_name}.plugin.zsh" ]; then
            source "${plugin_dir}/${plugin_name}.plugin.zsh"
        else
            echo "Couldn't auto-detect plugin file for ${plugin_dir}"
        fi
    fi
}

add_plugin zsh-users/zsh-autosuggestions
add_plugin zsh-users/zsh-syntax-highlighting

# Completion
autoload -Uz compinit
compinit

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt extendedhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_expire_dups_first

# Alias
alias vim='nvim'
alias code='cursor'

export EDITOR=nvim
export TERMINAL=ghostty
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Hooks
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
else
    echo "hint: install zoxide"
fi
eval "$(fzf --zsh)"
eval "$(starship init zsh)"



# bun completions
[ -s "/Users/ryan/.bun/_bun" ] && source "/Users/ryan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# rustup
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"

# cargo installs
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/ryan/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/ryan/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# pnpm
export PNPM_HOME="/Users/ryan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
