# see - https://thevaluable.dev/zsh-install-configure-mouseless/

# Reads these files in the following order
# .zshenv - Should only contain user’s environment variables.
# .zprofile - Can be used to execute commands just after logging in.
# .zshrc - Should be used for the shell configuration and for executing commands.
# .zlogin - Same purpose than .zprofile, but read just after .zshrc.
# .zlogout - Can be used to execute commands when a shell exit.


# Created by newuser for 5.8.1

# colors
# autoload -U colors && colors
# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

autoload -U colors && colors
PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[cyan]%}%1~%{$reset_color%} %% "

# custom prompt
fpath=($HOME/zsh_prompts/purification $fpath)
autoload -Uz prompt_purification_setup && prompt_purification_setup

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
