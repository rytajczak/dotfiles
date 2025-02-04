EDITOR=nvim

alias vim=nvim

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"

export ELECTRON_OZONE_PLATFORM_HINT="auto"

# pnpm
export PNPM_HOME="/home/ryan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
