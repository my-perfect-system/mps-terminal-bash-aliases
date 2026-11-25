#!/usr/bin/env bash
# Deploy mps-terminal-bash-aliases to /etc/bash_aliases.d (system-wide). Idempotent.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="/etc/bash_aliases.d"
ALIASES_SRC="${SRC}/bash_aliases.d"

SUDO=""
[[ ${EUID} -eq 0 ]] || SUDO="sudo"

${SUDO} install -d -m 0755 "${DEST}"
for f in "${ALIASES_SRC}"/.bashrc_alias_*; do
  [[ -e "${f}" ]] || continue
  ${SUDO} install -m 0644 "${f}" "${DEST}/$(basename "${f}")"
done

echo "mps-terminal-bash-aliases installed to ${DEST}. Run: exec bash"