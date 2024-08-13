export ZSH="$HOME/.oh-my-zsh" # Path to your Oh My Zsh installation.
echo "Initializing the runtime environment (.zshrc)"

# ZSH_THEME="robbyrussell" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="%F{red}...%f"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git) # Standard plugins can be found in $ZSH/plugins/
source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.pre-oh-my-zsh
source $ZSHPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSHPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  if [ "$MYPROMPT" = "oh-my-posh" ]; then
    echo " - oh-my-posh prompt preferred."
    if command -v oh-my-posh >/dev/null 2>&1; then
      eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/actual.toml)"
    else
      echo " - oh-my-posh is not installed."
    fi
  elif [ "$MYPROMPT" = "starship" ]; then
    echo " - starship prompt preferred."
    if command -v starship >/dev/null 2>&1; then
      eval "$(starship init zsh)"
    else
      echo " - starship is not installed."
    fi
  else
    echo " - Prompt setting?"
  fi
else {
  echo " - On Apple Terminal..."
  setopt prompt_subst
  autoload -Uz vcs_info
  precmd() { vcs_info }
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:git*' formats '%$-> %s %b (%a) %m%u%c '
  #PS1='%n@%m:%/%f ${vcs_info_msg_0_}%%# '
  PS1=$(printf "%*s\r%s\n%%# " "$(tput cols)" '${vcs_info_msg_0_}' '%n@%m:%~')
  }
fi
