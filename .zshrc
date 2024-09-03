setopt HIST_IGNORE_ALL_DUPS

WORDCHARS=${WORDCHARS//[\/]}

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

export LANG=ja_JP.UTF-8

bindkey -e

setopt complete_in_word

autoload -Uz colors
colors

setopt correct

HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=50000

setopt hist_ignore_dups
setopt hist_expand
setopt share_history

alias repo='cd $(repos)'
alias repos="ghq list -p | fzf"
alias vz="vim ~/.zshrc"
alias nz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias vv="vim ~/.vimrc"
alias nn="nvim ~/.config/nvim"

# export PATH="/usr/local/bin/vim:$PATH"

export XDG_CONFIG_HOME=~/.config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [[ "${+commands[go]}" == 1 ]] ;then
  export GOPATH=$(go env GOPATH)
  export GOBIN=$(go env GOPATH)/bin
  export PATH=$GOPATH/bin:$PATH
fi

export EDITOR=nvim
export PATH=$HOME/.cargo/bin:$PATH

if [ -d "$HOME/.zshrc.d" ] && [ "$(ls -A $HOME/.zshrc.d)" ]; then
  for file in $HOME/.zshrc.d/*; do
    [ -r "$file" ] && source "$file"
  done
fi

alias ls="eza"
