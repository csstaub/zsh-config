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
  source "/usr/local/opt/fzf/shell/completion.zsh"
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

_fzf_compgen_path() {
  find -L "$1" -mindepth 1 -not -path '*/\.*' | sed 's@^\./@@'
}

_fzf_compgen_dir() {
  find -L "$1" -type d -mindepth 1 -not -path '*/\.*' | sed 's@^\./@@'
}

# Change vi mode cursor shape in iTerm
function zle-set-cursor-shape {
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=0\C-G" ;;
    viins|main) print -n -- "\E]50;CursorShape=1\C-G" ;;
  esac

  zle reset-prompt
  zle -R
}

function zle-line-init {
  if (( $+terminfo[smkx] )); then
    echoti smkx
  fi
  zle editor-info

  # Set cursor based on mode
  zle-set-cursor-shape
}

function zle-keymap-select {
  zle editor-info

  # Set cursor based on mode
  zle-set-cursor-shape
}

function zle-line-finish {
  if (( $+terminfo[rmkx] )); then
    echoti rmkx
  fi
  zle editor-info

  # Reset to block cursor
  print -n -- "\E]50;CursorShape=0\C-G"
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

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
