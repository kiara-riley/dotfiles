export EDITOR="nvim"

BASE16_SHELL="$DOTFILES/base16/base16-shell/"
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_atelier-forest

# Check the win size since tmux will change the size often
shopt -s checkwinsize
shopt -s histappend

# Use coreutils utils for OSX
if [[ $(uname -s) == "Darwin" ]]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi

PATH="$PATH:$HOME/bin:$HOME/bin/tmux"

# Ignore duplicate bash history items
export HISTCONTROL=ignoreboth:erasedups

# Use static ssh auth sock
export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock

export FZF_DEFAULT_OPTS="--bind 'ctrl-space:clear-query' --info inline"

gpg-connect-agent -q /bye

# Home manager
if [ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
  source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi
