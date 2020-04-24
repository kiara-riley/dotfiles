if [[ -f "/etc/fedora-release" ]];
then
  sudo dnf install -y tmux java-1.8.0-openjdk-devel
  sudo alternatives --set java java-1.8.0-openjdk.x86_64
  sudo dnf remove -y PackageKit-command-not-found
fi
