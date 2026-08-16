# enable starship
eval "$(starship init zsh)"

# plugins
# install them via homebrew and source here
[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias ls="eza --icons=always --color=always"
alias ll="eza -l --icons=always --color=always"
alias la="eza -a --icons=always --color=always"
alias lla="eza -la --icons=always --color=always"
alias tree="eza --tree --icons=always --color=always"

# env
[ -f "$HOME/.secrets.zsh" ] && source $HOME/.secrets.zsh
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
export ANTHROPIC_API_KEY=""
export CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1
# export CLAUDE_MODEL="openai/gpt-oss-20b:free"
export CLAUDE_MODEL="nvidia/nemotron-3-ultra-550b-a55b:free"
export CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS="true"
export ANTHROPIC_DEFAULT_FABLE_MODEL=$CLAUDE_MODEL
export ANTHROPIC_DEFAULT_OPUS_MODEL=$CLAUDE_MODEL
export ANTHROPIC_DEFAULT_SONNET_MODEL=$CLAUDE_MODEL
export ANTHROPIC_DEFAULT_HAIKU_MODEL=$CLAUDE_MODEL
export CLAUDE_CODE_SUBAGENT_MODEL=$CLAUDE_MODEL
