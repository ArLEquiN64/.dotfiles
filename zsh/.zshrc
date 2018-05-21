#
# Executes commands at the start of an interactive session.
#
# Authors:
#   ArLE <ARLEQUIN.prx@gmail.com>
#

# export ANYENV_ROOT="$DOTPATH/anyenv"
# if [ -d $ANYENV_ROOT ] ; then
#   export PATH="$ANYENV_ROOT/bin:$PATH"
#   eval "$(anyenv init -)"
#   # tmux対応
#   for D in `ls $ANYENV_ROOT/envs`
#   do
#     export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
#   done
#   if [ -d $ANYENV_ROOT/envs/pyenv/plugins/pyenv-virtualenv ] ;then
#     eval "$(pyenv virtualenv-init -)"
#   fi
# fi

# eval "$(hub alias -s)"

# # 色を使用出来るようにする
# colors

# # Define prompts.
# PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~ > "
# RPROMPT="${git_info:+${(e)git_info[status]}}"
# SPROMPT='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '

# # grep のハイライトを変更する(黒, マゼンダ)
# export GREP_COLOR='30;45'
# # ディレクトリ補完の色を変更する
# zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}:st=30;44"
# # ls の色をデフォルトに戻す
# # export LSCOLORS=exfxcxdxbxegedabagacad

# # 補完の時にベルを鳴らさない
# setopt NO_LIST_BEEP

# # 大文字、小文字を区別せず補完する
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=**' 'r:|=*' 'l:|=*' '+m:{A-Z}={a-z}'

# # インタラクティブモードにする
# zstyle ':completion:*:*:*:*:*' menu select interactive

# # KillAll の補完
# zstyle ':completion:*:*:*:*:processes-names' command 'ps -u $LOGNAME -o command -w'
# zstyle ':completion:*:*:killall:*' menu yes select
# zstyle ':completion:*:*:killall:*' force-list always
# zstyle ':completion:*:*:killall:*' insert-ids single

# # 履歴補完の色を変更
# # zstyle -s ':prezto:module:history-substring-search:color' found \
# #   'HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND' \
# #     || HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=black,bold'
# #
# # zstyle -s ':prezto:module:history-substring-search:color' not-found \
# #   'HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND' \
# #     || HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black,bold'

# # 最初のタブキー押下で cd を補完
# first-tab() {
#   if [[ $#BUFFER == 0 ]]; then
#     BUFFER="cdls "
#     CURSOR=5
#     zle list-choices
#     # zle menu-complete
#   else
#     # 展開する前に補完候補を出させる
#     # zle menu-complete
#     zle expand-or-complete
#   fi
# }
# zle -N first-tab
# bindkey '^I' first-tab

umask 022
limit coredumpsize 0
bindkey -d

# Return if zsh is called from Vim
if [[ -n $VIMRUNTIME ]]; then
    return 0
fi

# tmux_automatically_attach attachs tmux session
# automatically when your are in zsh
# $DOTPATH/bin/tmuxx

if [[ -f $ZDOTDIR/zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=$ZDOTDIR/zplug.zsh
    source $ZDOTDIR/zplug/init.zsh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

