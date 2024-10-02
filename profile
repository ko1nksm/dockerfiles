echo "profile loaded" >&2

export DOTROOT="$HOME/dotfiles"
read DOTNAME < "$HOME/.dotfiles"
export DOTNAME=${DOTNAME:-default}

if [ -r "$DOTROOT/$DOTNAME/profile" ]; then
  . "$DOTROOT/$DOTNAME/profile"
elif [ -r "$DOTROOT/default/profile" ]; then
  . "$DOTROOT/default/profile"
fi
