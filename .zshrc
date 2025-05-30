if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  source $HOME/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

  # To customize prompt, run `p10k configure` or edit ~/.config/zsh/config.d/00_p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  [[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
fi

export PATH=/Users/ebarajas/figma/figma/devex/bins:$PATH
export PRESERVE_HUNKS=1

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
	source "${conf}"
done

unset conf
eval "$(rbenv init -)"
export RACK_ENV=development
export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
