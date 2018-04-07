# Source machine-local ZSH config
if [[ -s "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source FZF
if [[ -s "/usr/local/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOME/.zshrc.fzf"
  source "/usr/local/opt/fzf/shell/completion.zsh"
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

if uname -a | grep -q Darwin; then
  source "$HOME/.zshrc.mac"
fi

# ZSH setting overrides
# Use 'v' to enter editor
bindkey -M vicmd v edit-command-line

alias vim='nvim'
export VISUAL='nvim'
export EDITOR='nvim'
