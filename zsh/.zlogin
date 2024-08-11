if [ -n $MYZSHRC ]; then
  unset MYZSHRC
fi

if [ -z $MYZLOGIN ]; then
  if [[ -n "$PS1" ]]; then
    echo "Login script... (.zlogin)"
  else
    return
  fi
  neofetch
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    #tmux
  fi

  export MYZLOGIN="TRUE"
fi
