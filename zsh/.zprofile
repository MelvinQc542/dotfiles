if [ -n $MYZSHENV ]; then
  unset MYZSHENV
fi

if [ -z $MYZPROFILE ]; then
  echo "Configuring the user's profile (.zprofile)"

  if command -v git >/dev/null 2>&1; then
    plugins=(git)
  else
    echo "git not installed."
  fi

  if [ $ARCH = "Darwin" ]; then
    if command -v brew >/dev/null 2>&1; then
      eval "$(/usr/local/bin/brew shellenv)" # Configuration for Homebrew (if installed)
    else
      echo "brew is not installed."
    fi
  fi

  if command -v oh-my-posh >/dev/null 2>&1; then
    if [ "$TERM_PROGRAM" != "" ] && i[ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
      eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/actual.toml)" # Configuration for oh-my-posh (if installed)
    else
      if [ "$TERM_PROGRAM" = "" ]; then
        echo -n
      else
        echo "oh-my-posh not supported on Apple Terminal"
      fi
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git svn
      zstyle ':vcs_info:*' check-for-changes true
      precmd() { vcs_info }
      setopt prompt_subst
      zstyle ':vcs_info:git*' formats '-> %s %b (%a) %m%u%c '
      PS1='%n@%m:%/%f ${vcs_info_msg_0_}%# '
    fi
  else
    echo "oh-my-posh is not installed."
  fi

  # Options found on "Dreams of autonomy" YT video 2024-05-16
  bindkey -e
  bindkey '^p' history-search-backward
  bindkey '^n' history-search-forward
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

  # My aliases
  #
  # MacOS only
  if [ $ARCH = "Darwin" ]; then
    alias 1p='open -a 1Password'
    alias copilot='open -a Microsoft\ Edge https://copilot.microsoft.com'
    alias edge='open -a Microsoft\ Edge'
    alias fdt='open -a Microsoft\ Excel ~/docs/2aires/gesTI.ca/2.\ Aires/2.1\ Gestion\ \&\ Administration/2.1a\ Comptabilité/Feuilles\ de\ temps\ 2024/Outils\ 2024.xlsx'
    alias lock='clear && open -a ScreenSaverEngine'
    alias mail='open -a Mail'
    alias outlook='open -a Microsoft\ Outlook'
    alias safari='open -a Safari'
    alias runsudo='echo "$(op item get linux --fields password)" | sudo -S whoami'
    alias textedit='open -a TextEdit'
    alias vmarch='open ~/Virtual\ Machines.localized/Arch\ Linux.vmwarevm/Arch\ Linux.vmx'
    alias word='open -a Microsoft\ Word'
  fi
  #
  # Linux stuff
  alias cd='z'
  alias dim='echo -n $COLUMNS;echo -n "x";echo $LINES'
  alias fzf='fzf --preview="bat --color=always {}"'
  alias ls='eza'
  if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    alias invim='nvim $(fzf -m --preview="bat --color=always {}")'
    # Next alias - for only 1 file instead of many (use tab)
    #alias ivi='vi $(fzf --preview="bat --color=always {}")'
  else
    #alias vi='vim'
  fi
  alias tmux2v='tmux new-session -d \; split-window -v \; select-pane -U \; attach-session'
  alias tmux2h='tmux new-session -d \; split-window -h \; select-pane -L \; attach-session'
  alias tmux4='tmux new-session -d \; split-window -v \; split-window -h \; select-pane -U \; split-window -h \; select-pane -L \; attach-session'
  # Other stuff
  alias dark='ln -sf ~/.config/alacritty/themes/catppuccin_mocha.toml ~/.config/alacritty/actual.toml'
  alias light='ln -sf ~/.config/alacritty/themes/everforest_light.toml ~/.config/alacritty/actual.toml'

  # End of script

  export MYZPROFILE="TRUE"
fi
