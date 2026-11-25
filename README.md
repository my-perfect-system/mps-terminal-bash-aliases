# mps-terminal-bash-aliases

System-wide bash aliases of the [my-perfect-system](https://github.com/my-perfect-system) (mps) terminal stack.

Each topic lives in its own `.bashrc_alias_<topic>` file. The main bash
configuration ([mps-terminal-bash](https://github.com/my-perfect-system/mps-terminal-bash))
sources every `/etc/bash_aliases.d/.bashrc_alias_*` file alphabetically,
then any per-user overrides from `~/.config/bash_aliases.d/.bashrc_alias_*`.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/my-perfect-system/mps-terminal-bash-aliases/main/bootstrap.sh | bash
```

Clones the repo to the system-wide mps repo dir
`${MPS_REPO_DIR:-/srv/repo/github/my-perfect-system}` — the same clone the
`odem.terminal.bash` role manages — and runs [`install.sh`](install.sh),
which copies the alias files to `/etc/bash_aliases.d/` with `sudo` (the
password prompt reads the terminal, not the pipe). One clone per host: every
user can run the same command. Re-run it to update. The clone location defaults
to `REPO_DIR_DEFAULT` in [`bootstrap.sh`](bootstrap.sh) (override per
invocation with the `MPS_REPO_DIR` env var).

## Install Ansible

Installed by the `odem.terminal.bash` role of the
[odem-terminal](https://github.com/my-perfect-system/odem-terminal) collection,
which clones this repository and copies the alias files to `/etc/bash_aliases.d/`.

## Install Standalone

```bash
sudo ./install.sh    # copies .bashrc_alias_* to /etc/bash_aliases.d/; idempotent
```

Requires the `mps-terminal-bash` bash configuration (or any `.bashrc` that
sources `/etc/bash_aliases.d/.bashrc_alias_*`).

## Topics

`ansi` `ansible` `batcat` `cfg` `common` `directories` `disks` `docker`
`editor` `espidf` `eza` `filemanager` `files` `fzf` `git` `info`
`lmstudio` `ls` `mount` `mps` `net` `opencode` `other` `packages`
`python` `run` `skeletons` `ssh` `systemd` `terminal` `tmux` `umi` `zoxide`

## Usage

```bash
pai htop                         # sudo apt install htop
pauu                             # apt update && upgrade && autoremove
v file.txt                       # open in nvim
mpsrepo                          # zoxide jump to the mps repo dir
```

## Creating new aliases

```bash
echo "alias ll='eza -la --git'" > .bashrc_alias_ls2   # new .bashrc_alias_<topic>
                                                     # file in the repo
git add .bashrc_alias_ls2 && git commit -m "Add ls2 aliases" && git push
curl -fsSL https://raw.githubusercontent.com/my-perfect-system/mps-terminal-bash-aliases/main/bootstrap.sh | bash
                                                     # redeploy: pulls the clone,
                                                     # copies to /etc/bash_aliases.d
```