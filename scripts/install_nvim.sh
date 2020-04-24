if [[ -f "/etc/fedora-release" ]];
then
  sudo dnf install -y neovim the_silver_searcher
  pip3 install --user --upgrade pynvim
fi
