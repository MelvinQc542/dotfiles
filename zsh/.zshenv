if [ -z $MYZSHENV ]; then

  if [[ -n "$PS1" ]]; then
    echo "Defining the environment (.zshenv)"
  else
    
  fi
 
  # Breakpoint
  # read -s -k "?Press any key to continue."
  # echo

  export ARCH=$(uname -s)
  export DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | awk -F'=' '{print $2}' | tr -d '"')

  if [ $ARCH = "Darwin" ]; then # Determine if Mac or...
    # Darwin's default PATH
    # export PATH=/usr/bin:/bin:/usr/sbin:/sbin
    export PATH=$PATH:$HOME/Documents/3ressources/gitRepo/miscTools/stuff/Scripts/Darwin
    export PATH=$PATH:$HOME/Documents/3ressources/gitRepo/miscTools/stuff/Scripts/Docker
    export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
    export PATH=$PATH:/Applications/iTerm.app/Contents/Resources/utilities
    export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Public
    export PATH=$PATH:/Applications/kitty.app/Contents/MacOS
    export PATH=$PATH:/Library/Apple/usr/bin
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
    export ZSHPLUGINS=/usr/local/share
  else
    # Arch's default PATH
    # export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin
    export PATH=$PATH:$HOME/Documents/gitRepo/miscTools/stuff/Scripts/zsh
    export PATH=$PATH:$HOME/.local/bin
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh/plugins/zsh-syntax-highlighting/highlighters
    export ZSHPLUGINS=/usr/share/zsh/plugins
  fi

  export PATH=$PATH:/usr/local/bin:/usr/local/sbin # Default linux stuff

  export PATH=$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/System/Cryptexes/App/usr/bin # Cryptex
  export PATH=$PATH:$HOME/.tmuxifier/bin

  export _ZO_EXCLUDE_DIRS=$HOME/Library:$HOME/Pictures:$HOME/Movies:/Applications:/System:/Library # zoxide environment variables

  export EDITOR="nvim"
  export VISUAL="nvim"
  #export LANG="fr_CA.UTF-8"
  #export LC_ALL="fr_CA.UTF-8"
  #export LC_CTYPE="fr_CA.UTF-8"
  export LANG="en_CA.UTF-8"
  export LC_ALL="en_CA.UTF-8"
  export LC_CTYPE="en_CA.UTF-8"
  
  # Fixing history not usable in other shell windows
  export HISTSIZE=5000
  export HISTFILE=$HOME/.zsh_history
  export HISTSAVE=$HISTSIZE
  export HISTDUP="erase"

  export DEFAULT_USER="$(whoami)"

  export MYPROMPT="oh-my-posh"
  #export MYPROMPT="starship"
  if [ "$MYPROMPT" = "starship" ]; then
    export ZSH_THEME="spaceship"
  fi
  export MYZSHENV="TRUE"
fi
