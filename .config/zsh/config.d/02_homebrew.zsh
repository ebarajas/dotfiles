# If homebrew is installed, export its shellenv
if command -v /opt/homebrew/bin/brew &>/dev/null; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
