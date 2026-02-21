# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managing shell (zsh), Vim, and related tool configurations.

## Repository Structure

- `setup.sh` — Symlinks dotfiles to home directory
- `format.sh` — Formats shell files with shfmt (2-space indent)
- `zshrc` — Zsh configuration using oh-my-zsh (robbyrussell theme, vi keybindings)
- `aliases` — Shell aliases (sourced by zshrc)
- `functions` — Shell functions, notably an AWS SSM session helper
- `vimrc` — Vim configuration with vim-plug plugin management
- `vim/autoload/plug.vim` — vim-plug plugin manager
- `vim/plugged/` — Installed plugins (gitignored)
- `secrets_example` — Template for `~/.secrets` (actual secrets file is not tracked)
- `cmd_profile.bat` — Windows CMD profile with Unix-like aliases

## Key Patterns

- **Vim plugins**: Managed via vim-plug. Install with `:PlugInstall`, update with `:PlugUpdate`. Plugin declarations are in `vimrc` between `call plug#begin()` and `call plug#end()`.
- **Version managers**: zshrc initializes nvm (Node, lazy-loaded), pyenv (Python), and rbenv (Ruby) when available.
- **Indentation**: 2 spaces default, 4 spaces for Python (configured in vimrc via autocmd).
- **Secrets**: Sourced from `~/.secrets` if it exists; use `secrets_example` as a template.
- **PATH additions**: Homebrew, Go, PostgreSQL, Oracle, SnowSQL, and MAMP paths are conditionally added in zshrc.

## Formatting

- **Shell files**: `./format.sh` runs `shfmt -w -i 2 -ci` on zshrc, aliases, functions
- **vimrc**: No formatter available; use `gg=G` in Vim to re-indent

## Git

- Default branch: `main`
