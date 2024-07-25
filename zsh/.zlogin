if [ -n $MYZSHRC ]; then
  unset MYZSHRC
fi

if [ -z $MYZLOGIN ]; then
  echo "Login script... (.zlogin)"
  neofetch

  export MYZLOGIN="TRUE"
fi
