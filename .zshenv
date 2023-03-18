# Env Vars for terminal and OS/FS structure
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/.local/bin/run"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# State controls
export HISTFILE="$ZDOTDIR/.zhistory"              # History filepath
export LESSHISTFILE="$HOME/CACHE/less/history"
export HISTSIZE=10000                             # Maximum events for internal history
export SAVEHIST=10000                             # Maximum events in history file

if test -f "$HOME/.config/exports"; then
	source "$HOME/.config/exports"
fi

