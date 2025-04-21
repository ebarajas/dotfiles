## Setting up dotfiles
Inspired by blog post at https://www.atlassian.com/git/tutorials/dotfiles

# Clone the repo
`git clone --bare https://github.com/ebarajas/dotfiles.git $HOME/.config`

# Checkout the bare repository in $HOME
`/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`

# Install Homebrew (on Macs)
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

# Run brew bundle to install packages
`cd $HOME && /opt/homebrew/bin/brew bundle`
