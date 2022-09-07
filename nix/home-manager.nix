{ config, pkgs, ... }:


{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kmckernan";
  home.homeDirectory = "/home/kmckernan";

  # Packages that should be installed to the user profile.
  home.packages = [
    # dynamic gets rid of a TH warning on every startup
    (pkgs.haskell-language-server.override { dynamic = true; })
    pkgs.neovim
    pkgs.nodejs
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
