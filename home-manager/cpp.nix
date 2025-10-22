{ pkgs, lib, ... }:
let

in
{
  home.packages = with pkgs; [
    # builder
    gnumake
    cmake
    bear

    # debugger
    llvmPackages_latest.lldb
    gdb

    # fix headers not found
    clang-tools

    # LPS and compiler
    llvmPackages_latest.libstdcxxClang

    # other tools
    cppcheck
    llvmPackages_latest.libllvm
    valgrind

    # stdlib for cpp
    llvmPackages_latest.libcxx

    # libs
    glm
    SDL2
    SDL2_gfx
  ];
}
