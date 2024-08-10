# General configuration
set -gx PATH /usr/local/bin $PATH
set -gx LANG en_US.UTF-8
set -U fish_greeting

# Interactive configruation
if status is-interactive

  set -gx EDITOR nvim

  alias fnix="nix-shell --run fish"
  alias ls="eza --icons always"


  starship init fish | source
  zoxide init --cmd cd fish | source
end

