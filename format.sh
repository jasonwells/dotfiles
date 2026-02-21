#!/bin/bash
# Format shell dotfiles with shfmt

shfmt -w -i 2 -ci \
  zshrc \
  aliases \
  functions
