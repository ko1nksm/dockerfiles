echo "bashrc loaded" >&2

if [ -r "$DOTROOT/$DOTNAME/bashrc" ]; then
  . "$DOTROOT/$DOTNAME/bashrc"
elif [ -r "$DOTROOT/default/bashrc" ]; then
  . "$DOTROOT/default/bashrc"
fi

