# If homebrew is installed, export its shellenv
if (( $+commands[brew] )); then
  eval $(brew shellenv)
fi
