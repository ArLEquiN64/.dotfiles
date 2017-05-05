# Vim-like keybind as default
bindkey -v
# Vim-like escaping jj keybind
bindkey -M viins 'jj' vi-cmd-mode

# Add emacs-like keybind to viins mode
bindkey -M viins '^F'  forward-char
bindkey -M viins '^B'  backward-char
# bindkey -M viins '^P'  up-line-or-history
# bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^K'  kill-line
# bindkey -M viins '^R'  history-incremental-pattern-search-backward
# bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^Y'  yank
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^D'  delete-char-or-list

bindkey -M vicmd '^A'  beginning-of-line
bindkey -M vicmd '^E'  end-of-line
bindkey -M vicmd '^K'  kill-line
bindkey -M vicmd '^P'  up-line-or-history
bindkey -M vicmd '^N'  down-line-or-history
bindkey -M vicmd '^Y'  yank
bindkey -M vicmd '^W'  backward-kill-word
bindkey -M vicmd '^U'  backward-kill-line
bindkey -M vicmd '/'   vi-history-search-forward
bindkey -M vicmd '?'   vi-history-search-backward

bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd 'G'  end-of-line


#
# functions
#
_delete-char-or-list-expand() {
    if [ -z "$RBUFFER" ]; then
        zle list-expand
    else
        zle delete-char
    fi
}
zle -N _delete-char-or-list-expand
bindkey '^D' _delete-char-or-list-expand


_start-tmux-if-it-is-not-already-started() {
    BUFFER="${${${(M)${+commands[tmuxx]}#1}:+tmuxx}:-tmux}"
    if has "tmux_automatically_attach"; then
        BUFFER="tmux_automatically_attach"
    fi
    CURSOR=$#BUFFER
    zle accept-line
}
zle -N _start-tmux-if-it-is-not-already-started
if ! is_tmux_runnning; then
    bindkey '^T' _start-tmux-if-it-is-not-already-started
fi
