ZPLUG_PROTOCOL=ssh

# zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "$ZDOTDIR", from:local, use:"<->_*.zsh"

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf"

zplug "stedolan/jq", \
    as:command, \
    from:gh-r

zplug "peco/peco", \
    as:command, \
    from:gh-r

zplug "b4b4r07/enhancd", use:init.sh

zplug "b4b4r07/emoji-cli", on:"junegunn/fzf-bin", if:'(( $+commands[jq] ))'

zplug "mrowa44/emojify", as:command

# zplug "modules/terminal", from:prezto
# zplug "modules/editor", from:prezto
# zplug "modules/history", from:prezto
# zplug "modules/directory", from:prezto
# zplug "modules/spectrum", from:prezto
# zplug "modules/utility", from:prezto
# zplug "modules/completion", from:prezto
# zplug "modules/git", from:prezto
# zplug "modules/prompt", from:prezto
# zstyle ':prezto:module:prompt' theme 'sorin'

# zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
# zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-history-substring-search", defer:3
# zplug "zsh-users/zsh-syntax-highlighting", defer:2

# zplug "glidenote/hub-zsh-completion"
# zplug 'Valodim/zsh-curl-completion'

# zplug 'b4b4r07/epoch-cat', \
#     as:command, \
#     hook-build:'go get -d && go build'

# zplug 'b4b4r07/copy', as:command, use:'(*).sh', rename-to:'$1'

# zplug "b4b4r07/ultimate", as:theme

# if zplug check "b4b4r07/ultimate"; then
#     zstyle ':ultimate:prompt:path' mode 'shortpath'
# fi

# zplug 'b4b4r07/zplug-doctor', lazy:yes
# zplug 'b4b4r07/zplug-cd', lazy:yes
# zplug 'b4b4r07/zplug-rm', lazy:yes

# zplug 'b4b4r07/tmux-powertools', \
#     hook-load:'tmux-loader'

# zplug 'b4b4r07/git-powertools', \
#     as:command, \
#     use:'bin/*'

# zplug 'b4b4r07/zls', lazy:yes
# zplug 'b4b4r07/fpath-editor', lazy:yes

# zplug 'andialbrecht/sqlparse', \
#     as:command, \
#     hook-build:'python setup.py install'

# zplug 'b4b4r07/fzf-powertools', \
#     as:command, \
#     use:'re'

# zplug 'b4b4r07/git-switch', \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# zplug 'b4b4r07/zsh-history', defer:3, use:init.zsh
# zplug 'b4b4r07/zsh-history', as:command, use:misc/fzf-wrapper.zsh, rename-to:ff

# if zplug check 'b4b4r07/zsh-history'; then
#     export ZSH_HISTORY_FILE="$HOME/.zsh_history.db"
#     ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
#     ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
#     ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
#     ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
#     ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"
# fi

# zplug 'Fakerr/git-recall', \
#     as:command, \
#     use:'git-recall'
