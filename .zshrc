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

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.cache/zsh/history
setopt appendhistory
setopt sharehistory
setopt extendedhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_expire_dups_first

# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit

# VCS integration
autoload -Uz vcs_info add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{245}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{245}*%f'
zstyle ':vcs_info:git:*' formats '%F{245}%b%f%u%c'
zstyle ':vcs_info:git:*' actionformats '%F{245}%b|%a%f%u%c'
add-zsh-hook precmd vcs_info

# Prompt
PROMPT='%F{blue}%~%f %F{245}${vcs_info_msg_0_}%f'$'\n''$ '
precmd() { precmd() {echo} }

# Alias
alias vim='nvim'
alias ls='ls --color'

# Hooks
eval "$(fzf --zsh)"
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

export EDITOR=nvim
export TERMINAL=ghostty
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

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
