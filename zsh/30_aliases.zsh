alias p="print -l"

# For mac, aliases
if is_osx; then
    has "qlmanage" && alias ql='qlmanage -p "$@" >&/dev/null'
    alias gvim="open -a MacVim"
fi

if has 'git'; then
    alias gst='git status'
fi

if has 'richpager'; then
    alias cl='richpager'
fi

if (( $+commands[gls] )); then
    alias ls='gls -F --color --group-directories-first'
elif (( $+commands[ls] )); then
    if is_osx; then
        alias ls='ls -GF'
    else
    alias ls='ls -F --color'
    fi
fi

# Common aliases
alias ..='cd ..'
alias ld='ls -ld'          # Show info about the directory
alias lla='ls -lAF'        # Show hidden all files
alias ll='ls -lF'          # Show long file information
alias la='ls -AF'          # Show hidden files
alias lx='ls -lXB'         # Sort by extension
alias lk='ls -lSr'         # Sort by size, biggest last
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lt='ls -ltr'         # Sort by date, most recent last
alias lr='ls -lR'          # Recursive ls

# The ubiquitous 'll': directories first, with alphanumeric sorting:
#alias ll='ls -lv --group-directories-first'

alias cp="${ZSH_VERSION:+nocorrect} cp -i"
alias mv="${ZSH_VERSION:+nocorrect} mv -i"
alias mkdir="${ZSH_VERSION:+nocorrect} mkdir"

autoload -Uz zmv
alias zmv='noglob zmv -W'

alias du='du -h'
alias job='jobs -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Use if colordiff exists
if has 'colordiff'; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# alias vi="vim"

# Use plain vim.
# alias nvim='vim -N -u NONE -i NONE'

# The first word of each simple command, if unquoted, is checked to see
# if it has an alias. [...] If the last character of the alias value is
# a space or tab character, then the next command word following the
# alias is also checked for alias expansion
alias sudo='sudo '
if is_osx; then
    alias sudo="${ZSH_VERSION:+nocorrect} sudo "
fi

# Global aliases
alias -g G='| grep'
alias -g GG='| multi_grep'
alias -g W='| wc'
alias -g X='| xargs'
alias -g F='| "$(available $INTERACTIVE_FILTER)"'
alias -g S="| sort"
alias -g V="| tovim"
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"
alias -g VI='| xargs -o vim'

multi_grep() {
    local std_in="$(cat <&0)" word

    for word in "$@"
    do
        std_in="$(echo "${std_in}" | command grep "$word")"
    done

    echo "${std_in}"
}

(( $+galiases[H] )) || alias -g H='| head'
(( $+galiases[T] )) || alias -g T='| tail'

if has "emojify"; then
    alias -g E='| emojify'
fi

if has "jq"; then
    alias -g JQ='| jq -C .'
    alias -g JL='| jq -C . | less -R -X'
fi

if is_osx; then
    alias -g CP='| pbcopy'
    alias -g CC='| tee /dev/tty | pbcopy'
fi

cat_alias() {
    local i stdin file=0
    stdin=("${(@f)$(cat <&0)}")
    for i in "${stdin[@]}"
    do
        if [[ -f $i ]]; then
            cat "$@" "$i"
            file=1
        fi
    done
    if [[ $file -eq 0 ]]; then
        echo "${(F)stdin}"
    fi
}
alias -g C="| cat_alias"

# less
alias -g L="| cat_alias | less"
alias -g LL="| less"

pygmentize_alias() {
    if has "pygmentize"; then
        local get_styles styles style
        get_styles="from pygments.styles import get_all_styles
        styles = list(get_all_styles())
        print('\n'.join(styles))"
        styles=( $(sed -e 's/^  *//g' <<<"$get_styles" | python) )

        style=${${(M)styles:#solarized}:-default}
        cat_alias "$@" | pygmentize -O style="$style" -f console256 -g
    else
        cat -
    fi
}
alias -g P="| pygmentize_alias"


awk_alias() {
    local -a options fields words
    while (( $#argv > 0 ))
    do
        case "$1" in
            -*)
                options+=("$1")
                ;;
            <->)
                fields+=("$1")
                ;;
            *)
                words+=("$1")
                ;;
        esac
        shift
    done
    if (( $#fields > 0 )) && (( $#words > 0 )); then
        awk '$'$fields[1]' ~ '${(qqq)words[1]}''
    elif (( $#fields > 0 )) && (( $#words == 0 )); then
        awk '{print $'$fields[1]'}'
    fi
}
alias -g A="| awk_alias"

eval "$(hub alias -s)"
