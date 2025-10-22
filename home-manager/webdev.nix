{ pkgs, lib, ... } :
let

in
{
  home.packages = with pkgs; [
    nodejs
    curl
    wget
  ] ++ (with pkgs.nodePackages; [
    vscode-langservers-extracted
    live-server
    prettier
    postcss
  ]);
}
