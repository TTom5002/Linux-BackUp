{ pkgs, lib, ... } :
let

in
{
  home.packages = with pkgs; [
    php
    phpactor
    intelephense
    nodejs
    curl
    wget
    emmet-ls
  ] ++ (with pkgs.nodePackages; [
    vscode-langservers-extracted
    live-server
    prettier
    postcss
    typescript
    typescript-language-server
  ]);
}
