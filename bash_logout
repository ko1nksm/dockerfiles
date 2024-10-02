echo "bash_logout loaded" >&2

if [ -r "$DOTROOT/$DOTNAME/bash_logout" ]; then
  . "$DOTROOT/$DOTNAME/bash_logout"
elif [ -r "$DOTROOT/default/bash_logout" ]; then
  . "$DOTROOT/default/bash_logout"
fi
