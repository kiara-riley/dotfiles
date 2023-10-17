set -euo pipefail

if [[ -f "/etc/fedora-release" ]];
then
  sudo dnf install -y tilix NetworkManager-tui rofi arandr pavucontrol feh xclip network-manager-applet polybar
  sudo dnf install -y picom
  sudo dnf install -y i3-gaps i3status i3lock acpi
  sudo dnf copr enable -y vishalvvr/fontawesome-fonts # Normal repo out of date, check again @ fedora 39
  sudo dnf install -y fontawesome-free-fonts
fi
