source ~/.zplug/init.zsh

## Plugin
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug 'zsh-users/zsh-completions'
zplug "rupa/z", use:"*.sh"

# powerline_shell の設定
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

export LANG=ja_JP.UTF-8

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

eval "$(direnv hook zsh)"

export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export XDG_CONFIG_HOME=~/.config
