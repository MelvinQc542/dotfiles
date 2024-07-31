if [ -n $MYZSHRC ]; then
  unset MYZSHRC
fi

if [ -z $MYZLOGIN ]; then
  echo "Login script... (.zlogin)"
  neofetch
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    #tmux
  fi

  export MYZLOGIN="TRUE"
fi
