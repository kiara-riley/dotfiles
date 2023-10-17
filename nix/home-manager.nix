{ config, pkgs, lib, ... }:

{
  home.username = "kmckernan";
  home.homeDirectory = "/home/kmckernan";

  home.packages = [
    # dynamic gets rid of a TH warning on every startup
    (pkgs.haskell-language-server.override { dynamic = true; })
    pkgs.neovim
    pkgs.nodejs
    pkgs.ghc
    pkgs.haskellPackages.prune-juice

    pkgs.rustup
  ];

  programs.direnv = {
    enable = true;
  };
  services.lorri.enable = true;

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
