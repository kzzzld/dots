# enable starship
eval "$(starship init zsh)"

# plugins
# install them via homebrew and source here
[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# startup message
# fortune | cowsay

# secrets
[ -f ~/.secrets ] && source ~/.secrets
