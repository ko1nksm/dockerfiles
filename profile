# .profile
echo "profile loaded" >&2

export DOTROOT="$HOME/dotfiles"
read DOTNAME < "$HOME/.dotfiles"
export DOTNAME=${DOTNAME:-default}

if [ -r "$DOTROOT/$DOTNAME/profile" ]; then
  . "$DOTROOT/$DOTNAME/profile"
elif [ -r "$DOTROOT/default/profile" ]; then
  . "$DOTROOT/default/profile"
fi

if type vim >/dev/null 2>&1; then
  export EDITOR=vim
fi

# Slow connection
#if [ -x ~/.ssh/wsl2-ssh-pageant.exe ]; then
#  . "$DOTROOT/wsl2-ssh-pageant"
#fi
if [ -r ~/.keychain/$HOSTNAME-sh ]; then
  keychain -q --nogui $HOME/.ssh/id_rsa
  . ~/.keychain/$HOSTNAME-sh
fi

export TZ=Asia/Tokyo
