ZPLUGINDIR=${ZDOTDIR:-$HOME/.config/zsh}/plugins
# Pull in plugins via git
function plugin-clone {
  local repo plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      local -a initfiles=($plugdir/*.plugin.{z,}sh(N) $plugdir/*.{z,}sh{-theme,}(N))
      (( $#initfiles )) && ln -sf "${initfiles[1]}" "$initfile"
    fi
  done
}

function plugin-source {
  local plugdir
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    local initfile=$plugdir/${plugdir:t}.plugin.zsh
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}
repos=(
  # Testing
  hlissner/zsh-autopair
  base16-project/base16-shell
  rutchkiwi/copyzshell
  Vifon/deer
  anatolykopyl/doas-zsh-plugin
  Senderman/doas-zsh-plugin
  zpm-zsh/dropbox
  fabiogibson/envrc-zsh-plugin
  laggardkernel/zsh-iterm2
  gko/listbox
  aperezdc/zsh-notes
  sha1n/path-ethic
  jhwohlgemuth/oh-my-zsh-pentest-plugin
  philFernandez/printc
  the10thWiz/zsh-prompt-generator
  ya0201/qwer-ps1
  0b10/rc-files
  z-shell/redis
  aubreypwd/zsh-plugin-reload
  aperezdc/rockz
  cowboyd/zsh-rust
  xyproto/sealion
  kaplanelad/shellfirm
  saravanabalagi/zsh-plugin-singularityenv
  willghatch/zsh-snippets
  gko/ssh-connect
  hcgraf/zsh-sudo
  trapd00r/zsh-syntax-highlighting-filetypes
  skx/sysadmin-util
  sinetoami/web-search
  bryanculver/workon.plugin.zsh
  mattmc3/zsh-xdg-basedir
  MichaelAquilina/zsh-you-should-use
  kmhjs/zinfo_line
  z-shell/zsh-select
  freak2geek/zshrc
  therealklanni/purity.git
  zdharma-continuum/zsnapshot
  # not-sourcable plugins
  romkatv/zsh-bench
  # projects with nested plugins
  belak/zsh-utils
  # regular plugins
  zshzoo/omz-themes-standalone
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  zdharma-continuum/fast-syntax-highlighting
  romkatv/zsh-defer
  olets/zsh-abbr
)
plugin-clone $repos

autoload -U promptinit; promptinit
autoload -U bashcompinit; bashcompinit
autoload -Uz add-zsh-hook
source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_functions
test -e $ZDOTDIR/.iterm2_shell_integration.zsh && source $ZDOTDIR/.iterm2_shell_integration.zsh || true
unalias imgcat
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# eval "$(starship init zsh)"
