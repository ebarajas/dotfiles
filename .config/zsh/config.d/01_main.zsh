# ZSH Specific Options
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt no_beep
setopt auto_cd	
setopt prompt_subst

setopt append_history		    # Have each shell session append to the history file rather than replace it
setopt extended_history		    # Save the beginning timestamp and elapsed time with each command
setopt inc_append_history	    # Add lines to history incrementally rather than waiting for the shell to exit
setopt hist_ignore_dups		    # Don't add lines to history if they're dupes of the previous line 
setopt hist_expire_dups_first	# Remove duplicate lines first when trimming history 

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

unsetopt complete_aliases	# Unset this so completions work with aliases

export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LESS="-R --mouse"

alias ls="ls -alhG"

# Setting editor to vim also sets the vim keybindings in zsh
# This sets them back to emacs bindings
bindkey -e

# Prefer nvim over vim if installed
if [[ -x $(which nvim) ]]; then
  alias vim="nvim"
fi
