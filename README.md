## New Machine Setup
* Generate SSH Key
  * `ssh-keygen -t ed25519 -C "your_email@example.com"`
* Go and add the public key to GitHub settings

### Setting up dotfiles
Inspired by blog post at https://www.atlassian.com/git/tutorials/dotfiles

* Clone the repo
  * `git clone --bare https://github.com/ebarajas/dotfiles.git $HOME/.config`
* Make an alias for `config`
  * Only need this for the current shell session, config files will have this alias too
  * `alias config="/usr/bin/git --git-dir$HOME/.cfg --work-tree=$HOME"
* Checkout the bare repository in $HOME
  * `config checkout`
* Update submodules
  * `config submodule init`
  * `config submodule update` 
* Hide untracked files
  * `config config --local status.showUntrackedFiles no`

* Install Homebrew
  * `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* Run brew bundle
  * `cd $HOME && /opt/homebrew/bin/brew bundle`

## TODOs
* Figure out cross-platform package management (macOS & Linux)
  * Nix
  * Ansible?
