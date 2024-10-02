# .bashrc
echo "bashrc loaded" >&2

if [ -r "$DOTROOT/$DOTNAME/bashrc" ]; then
  . "$DOTROOT/$DOTNAME/bashrc"
elif [ -r "$DOTROOT/default/bashrc" ]; then
  . "$DOTROOT/default/bashrc"
fi

shopt -s cmdhist lithist
HISTCONTROL=ignoredups
HISTSIZE=50000

alias JP='LANG=ja_JP.UTF-8'
alias EN='LANG=en_US.UTF-8'
alias C='LANG=C'

PROMPT_COMMAND=__prompt_command
__prompt_command() {
  local xs=$? i=0 pipestatus=(${PIPESTATUS[@]})
  [ $((xs + ${pipestatus[@]/#/+})) -eq 0 ] && return 0
  [ "$xs" -gt 127 ] && xs="$xs ($(kill -l "$xs" 2>/dev/null))"
  if [ "${#pipestatus[@]}" -eq 1 ]; then
    printf "\033[31m# exit status: %s\033[0m\n" "$xs"
  else
    printf "\033[31m# exit status: %s - %s\033[0m\n" "$xs" "${pipestatus[*]}"
  fi
}
PROMPT_COMMAND=__prompt_command
