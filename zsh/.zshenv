if [ -z $MYZSHENV ]; then

  echo "Defining the environment (.zshenv)"
 
  # Breakpoint
  # read -s -k "?Press any key to continue."
  # echo

  export ARCH=$(uname -s)

  # **BEGIN Constructing PATH

  if [ $ARCH = "Darwin" ]; then # Determine if Mac or...
    # Darwin's default PATH
    # export PATH=/usr/bin:/bin:/usr/sbin:/sbin
    export PATH=$PATH:$HOME/Documents/3ressources/gitRepo/stuff/Scripts/bash/Darwin
    export PATH=$PATH:$HOME/.local/bin
    export PATH=$PATH:/Library/Apple/usr/bin
    export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
    export PATH=$PATH:/Applications/iTerm.app/Contents/Resources/utilities
    export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Public
    export PATH=$PATH:/Applications/kitty.app/Contents/MacOS
  else
    # Arch's default PATH
    # export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin
    export PATH=$PATH:$HOME/.local/bin
  fi

  export PATH=$PATH:/usr/local/bin:/usr/local/sbin # Default linux stuff

  export PATH=$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/System/Cryptexes/App/usr/bin # Cryptex

  # **END Constructing PATH

  export _ZO_EXCLUDE_DIRS=$HOME/Library:$HOME/Pictures:$HOME/Movies:/Applications:/System:/Library # zoxide environment variables

  export EDITOR="/usr/bin/nvim"

  # Fixing history not usable in other shell windows
  export HISTSIZE=5000
  export HISTFILE=$HOME/.zsh_history
  export HISTSAVE=$HISTSIZE
  export HISTDUP="erase"

  export MYZSHENV="TRUE"
fi
