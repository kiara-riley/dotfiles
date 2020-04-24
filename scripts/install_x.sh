
if [[ -f "/etc/fedora-release" ]];
then
  sudo dnf install -y tilix NetworkManager-tui rofi arandr pavucontrol feh compton xclip network-manager-applet polybar
  sudo dnf copr enable -y gregw/i3desktop
  sudo dnf install -y i3-gaps i3status i3lock acpi
  sudo dnf copr enable -y vishalvvr/fontawesome-fonts # Normal repo out of date
  sudo dnf install -y fontawesome-free-fonts
fi
