if [ -n $MYZLOGIN ]; then
  unset MYZLOGIN
fi

echo "Logout script... (.zlogout)"
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
  exit
fi
