def is_personal_machine?
  # Environment variable needs to have a `HOMEBREW_*` prefix
  # to get passed to `brew` commands
  env_val = ENV["HOMEBREW_IS_PERSONAL_MACHINE"]&.downcase&.slice(0)
  ["1", "y", "t"].include?(env_val)
end

brew "coreutils"
brew "fd"
brew "fzf"
brew "git"
brew "git-delta"
brew "jq"
brew "mas"
brew "moreutils"
brew "tmux"
brew "tree-sitter"
brew "watch"
brew "wget"
brew "xz"
brew "zsh"        # Install a newer version of ZSH than the default 

if is_personal_machine?
  brew "syncthing"
else
  puts "Skipping personal machine packages"
end

cask "spotify"

# These are sometimes managed by IT, so check if they're already installed
cask "1password" unless system "test -e /Applications/1Password.app"
cask "zoom" unless system "test -e /Applications/zoom.us.app"

cask "wezterm"
cask "ngrok"
cask "docker" 
cask "visual-studio-code"
cask "notion"

cask "raycast" 

cask "font-fira-code-nerd-font"
cask "font-jetbrains-mono-nerd-font"

mas "Amphetamine", id: 937984704
