if [[ -f "/etc/fedora-release" ]];
then
  sudo dnf install -y neovim
  pip3 install --user --upgrade pynvim
fi
