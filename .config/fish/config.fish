if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
	fish_logo
end

# Alias
alias ls="exa -l"
alias gg="lazygit"

# Constants
set -gx EDITOR nvim

# Init bruv bo'oh'o'wa'er
starship init fish | source
zoxide init fish | source

# Binaries
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
