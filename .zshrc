source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light agkozak/zsh-z
zplugin light sindresorhus/pure

export LANG=ja_JP.UTF-8

bindkey -e

autoload -U compinit
compinit -u

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

alias ls="ls -GF"
alias repo='cd $(repos)'
alias repos="ghq list -p | fzf"
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias vv="vim ~/.vimrc"

eval "$(hub alias -s)"

export PATH="/usr/local/bin/vim:$PATH"
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

# anyenv の設定追加
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    # tmux対応
    for D in `\ls $HOME/.anyenv/envs`
    do
      export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

export XDG_CONFIG_HOME=~/.config
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GOPATH=$HOME/go
export GOBIN=$(go env GOPATH)/bin
export PATH=$GOPATH/bin:$PATH

eval "$(direnv hook zsh)"

export EDITOR=vim
autoload -U +X bashcompinit && bashcompinit
export PATH=$HOME/.cargo/bin:$PATH
fpath+=${ZDOTDIR:-~}/.zsh_functions

# eval "$(starship init zsh)"
