# ZPLUGINDIR=${ZDOTDIR:-$HOME/.config/zsh}/plugins
# function plugin-clone {
#   local repo plugdir initfile
#   ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
#   for repo in $@; do
#     plugdir=$ZPLUGINDIR/${repo:t}
#     initfile=$plugdir/${repo:t}.plugin.zsh
#     if [[ ! -d $plugdir ]]; then
#       echo "Cloning $repo..."
#       git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
#     fi
#     if [[ ! -e $initfile ]]; then
#       local -a initfiles=($plugdir/*.plugin.{z,}sh(N) $plugdir/*.{z,}sh{-theme,}(N))
#       (( $#initfiles )) && ln -sf "${initfiles[1]}" "$initfile"
#     fi
#   done
# }
# function plugin-source {
#   local plugdir
#   ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
#   for plugdir in $@; do
#     [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
#     fpath+=$plugdir
#     local initfile=$plugdir/${plugdir:t}.plugin.zsh
#     (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
#   done
# }
# repos=(
#   the10thWiz/zsh-prompt-generator
#   trapd00r/zsh-syntax-highlighting-filetypes
#   zshzoo/omz-themes-standalone
#   zsh-users/zsh-autosuggestions
#   zdharma-continuum/fast-syntax-highlighting
#   romkatv/zsh-defer
#   olets/zsh-abbr
# )
# plugin-clone $repos
# autoload -U promptinit; promptinit
# autoload -U bashcompinit; bashcompinit
autoload -Uz add-zsh-hook
do-ls() {emulate -L zsh; ls;} && add-zsh-hook chpwd do-ls
source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_functions
source $ZDOTDIR/.iterm2_shell_integration.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dot/promptrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$(cat $ZDOTDIR/mypaths.conf | grep -v ^# | tr -s "\n" ":")
