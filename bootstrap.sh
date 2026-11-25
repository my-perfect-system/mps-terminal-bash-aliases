#!/usr/bin/env bash
# Bootstrap mps-terminal-bash-aliases: clone to ~/.local/share/mps and run install.sh.
# Standalone usage:
#   curl -fsSL https://raw.githubusercontent.com/my-perfect-system/mps-terminal-bash-aliases/main/bootstrap.sh | bash
# Needs sudo for /etc/bash_aliases.d — the password prompt reads the terminal
# tty, not the curl pipe, so `curl | bash` works unchanged.
set -euo pipefail

REPO_NAME="mps-terminal-bash-aliases"
REPO_URL="https://github.com/my-perfect-system/${REPO_NAME}.git"
DEST="${XDG_DATA_HOME:-$HOME/.local/share}/mps/${REPO_NAME}"

if [ -d "${DEST}/.git" ]; then
    echo "==> Updating ${DEST}"
    git -C "${DEST}" pull --ff-only
else
    echo "==> Cloning ${REPO_URL}"
    git clone --depth 1 "${REPO_URL}" "${DEST}"
fi

exec bash "${DEST}/install.sh"