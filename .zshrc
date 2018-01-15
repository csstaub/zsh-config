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
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

# Change cursor style based on keymap
zstyle ':prezto:module:editor:info:keymap:primary' format $' %B%F{1}❯%F{3}❯%F{2}❯%f%b\x1b]1337;CursorShape=1\x07'
zstyle ':prezto:module:editor:info:keymap:alternate' format $' %B%F{2}❮%F{3}❮%F{1}❮%f%b\x1b]1337;CursorShape=0\x07'

# ZSH setting overrides
# Use 'v' to enter editor
bindkey -M vicmd v edit-command-line

# Set ls colors
eval $(gdircolors)

alias vim='nvim'
alias ls='gls --color=auto'

export VISUAL='nvim'
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 20% --reverse'
