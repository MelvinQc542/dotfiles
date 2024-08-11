if [ -n $MYZSHENV ]; then
  unset MYZSHENV
fi

if [ -z $MYZPROFILE ]; then
  if [[ -n "$PS1" ]]; then
    echo "Configuring the user's profile (.zprofile)"
  else
    return
  fi
  if command -v git >/dev/null 2>&1; then
    plugins=(git)
  else
    echo "git not installed."
  fi

  if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    if [ "$MYPROMPT" = "oh-my-posh" ]; then
      echo "oh-my-posh prompt preferred."
      if command -v oh-my-posh >/dev/null 2>&1; then
        eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/actual.toml)"
      else
        echo "oh-my-posh is not installed."
      fi
    elif [ "$MYPROMPT" = "starship" ]; then
      echo "starship prompt preferred."
      if command -v starship >/dev/null 2>&1; then
        eval "$(starship init zsh)"
      else
        echo "starship is not installed."
      fi
    else
      echo "Prompt setting?"
    fi
  else
    echo "On Apple Terminal..."
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git svn
    zstyle ':vcs_info:*' check-for-changes true
    precmd() { vcs_info }
    setopt prompt_subst
    zstyle ':vcs_info:git*' formats '-> %s %b (%a) %m%u%c '
    PS1='%n@%m:%/%f ${vcs_info_msg_0_}%# '
  fi

  # Options found on "Dreams of autonomy" YT video 2024-05-16
  bindkey -e
  bindkey '^p' history-search-backward
  bindkey '^n' history-search-forward
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

  source .zaliases
  source .zcomplexaliases

  # End of script

  export MYZPROFILE="TRUE"
fi
