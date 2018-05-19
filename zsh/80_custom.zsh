export ANYENV_ROOT="$DOTPATH/anyenv"
# if [ -d $ANYENV_ROOT ] ; then
#   export PATH="$ANYENV_ROOT/bin:$PATH"
#   eval "$(anyenv init -)"
#   # tmux対応
#   # for D in `ls $ANYENV_ROOT/envs`
#   # do
#   #   export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
#   # done
#   if [ -d $ANYENV_ROOT/envs/pyenv/plugins/pyenv-virtualenv ] ;then
#     eval "$(pyenv virtualenv-init -)"
#   fi
# fi


. $DOTPATH/asdf/asdf.sh
. $DOTPATH/asdf/completions/asdf.bash

