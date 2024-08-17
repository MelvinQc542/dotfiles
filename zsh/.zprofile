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
    plugins=(1password brew docker eza fzf git macos node ssh thefuck) # Standard plugins can be found in $ZSH/plugins/
  else
    echo " - git not installed."
  fi

  source $HOME/.zaliases
  source $HOME/.zcomplexaliases

  (( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[path]=none
  ZSH_HIGHLIGHT_STYLES[path_prefix]=none
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

  # Options found on "Dreams of autonomy" YT video 2024-05-16
  bindkey -e
  bindkey '^p' history-search-backward
  bindkey '^n' history-search-forward

  # End of script

  export MYZPROFILE="TRUE"
fi
