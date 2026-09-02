# enable starship
eval "$(starship init zsh)"

# plugins
# install them via homebrew and source here
# [ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# [ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
set -o vi

# path
export PATH="$PATH:$HOME/.local/bin"

# aliases
alias l=ls
alias ls="eza --icons=always --color=always"
alias ll="eza -l --icons=always --color=always"
alias la="eza -a --icons=always --color=always"
alias lla="eza -la --icons=always --color=always"
alias tree="eza --tree --icons=always --color=always"
alias cd=z

# a fix for gpg
export GPG_TTY=$(tty)

# env
export EDITOR="nvim"

# path
export PATH="$PATH:$HOME/.cargo/bin"

# startup message
fastfetch -c neofetch

# secrets
[ -f ~/.secrets ] && source ~/.secrets
