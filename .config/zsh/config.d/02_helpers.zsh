function __is_macos() {
  [[ "$(uname)" == "Darwin" ]]
}

function flush_dns() {
  if __is_macos; then
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
  else
    echo "TODO: add linux command whoops"
  fi
}

# git checkout recent
# build a list of recently checked out branches using git reflog
# choose using fzf
function gcr() {
    local selected
    selected=$(git log -g --pretty=oneline | grep "moving from" | head -n 30 | awk '{print $(NF)}' | sort -u | fzf)
    print -s "git checkout $selected"
    git checkout $selected
}
