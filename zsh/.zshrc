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

autoload -U promptinit && promptinit

# optionally define some options
# the max execution time of a process before its run time is shown when it exits. Defaults to 5 seconds
PURITY_CMD_MAX_EXEC_TIME=10
# prevent Purity from checking whether the current Git remote has been updated
PURITY_GIT_PULL=0

prompt purity

# [error] purity prompt expects external undocumented git_prompt_* functions
# solved by - https://github.com/therealklanni/purity/issues/2#issuecomment-288758380
source ~/.zshlib/git.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
