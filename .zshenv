[[ $(uname) == "Darwin" ]] && export OS_TYPE=macos || export OS_TYPE=linux
env > envir.py
export ZDOTDIR=$HOME/.config/zsh
source $ZDOTDIR/.zsh_exports

