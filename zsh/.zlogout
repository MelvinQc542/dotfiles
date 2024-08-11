if [ -n $MYZLOGIN ]; then
  unset MYZLOGIN
fi

  if [[ -n "$PS1" ]]; then
    echo "Logout script... (.zlogout)"
  else
    return
  fi
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    exit
  fi
