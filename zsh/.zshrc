# Enable command auto-correction
setopt CORRECT

# Aliases
alias ga='git add .'
alias gc='git commit -m'
alias gs='git status'
alias gp='git pull'
alias gpush='git push'
alias v='nvim'

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Set editor to Neovim
export EDITOR='nvim'
export VISUAL='nvim'

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
