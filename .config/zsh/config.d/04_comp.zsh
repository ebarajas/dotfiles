autoload -Uz compinit; compinit

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi
