alias sourcebash="source ~/.bashrc"
alias ls="ls --color=auto"
alias ll="ls -l"

alias cc="xclip -selection c"

alias refeh="feh --randomize --bg-fill ~/Pictures/wallpapers/"

alias vim="nvim" # I've used this for a few years and I like it enough as a total replacement

reshell() {
  [[ ! -z "$IN_NIX_SHELL" ]] && { exit 1; return; }
  nix-shell || reshell
}

alias newdirenv="echo 'use nix' > .envrc && direnv allow"

newagent() {
  eval $(ssh-agent -s)

  if test "$SSH_AUTH_SOCK" ; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
  fi
}
