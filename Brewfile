tap "homebrew/cask-fonts"

brew "git"
brew "jq"
brew "fzf"
brew "tmux"
brew "mas"
brew "coreutils"
brew "moreutils"
brew "tree-sitter"
brew "watch"
brew "wget"
brew "xz"
brew "zsh"        # Install a newer version of ZSH than the default 

brew "solargraph" # Ruby LSP

cask "spotify"

# These are sometimes managed by IT, so check if they're already installed
cask "1password" unless system "test -e /Applications/1Password.app"
cask "zoom" unless system "test -e /Applications/zoom.us.app"

cask "wezterm"
cask "ngrok"
cask "docker" 
cask "visual-studio-code"
cask "notion"

# MacOS only Casks
cask "raycast" if OS.mac?
cask "hammerspoon" if OS.mac?
cask "logitech-options" if OS.mac?

cask "font-fira-code-nerd-font"
cask "font-jetbrains-mono-nerd-font"

mas "Amphetamine", id: 937984704
