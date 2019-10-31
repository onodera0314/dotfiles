source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light agkozak/zsh-z

export LANG=ja_JP.UTF-8

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
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
