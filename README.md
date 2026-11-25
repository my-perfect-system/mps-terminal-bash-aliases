# mps-terminal-bash-aliases

System-wide bash aliases of the [my-perfect-system](https://github.com/my-perfect-system) (mps) terminal stack.

Each topic lives in its own `.bashrc_alias_<topic>` file. The main bash
configuration ([mps-terminal-bash](https://github.com/my-perfect-system/mps-terminal-bash))
sources every `/etc/bash_aliases.d/.bashrc_alias_*` file alphabetically,
then any per-user overrides from `~/.config/bash_aliases.d/.bashrc_alias_*`.

## Install

| Method | Description |
|---|---|
| Default | `bootstrap.sh` clones to the system-wide mps repo dir and runs `install.sh` (sudo) |
| Ansible | Included in role `odem.terminal.bash` of [odem-terminal](https://github.com/my-perfect-system/odem-terminal) |
| Standalone | run `sudo ./install.sh`; no network needed |

```bash
curl -fsSL https://raw.githubusercontent.com/my-perfect-system/mps-terminal-bash-aliases/main/bootstrap.sh | bash
```

All methods copy the `.bashrc_alias_*` files to `/etc/bash_aliases.d/` (the sudo
prompt reads the terminal, so `curl | bash` works). Requires
[mps-terminal-bash](https://github.com/my-perfect-system/mps-terminal-bash).

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
```

## Creating new aliases

```bash
echo "alias ll='eza -la --git'" > .bashrc_alias_ls2   # new .bashrc_alias_<topic>
                                                     # file in the repo
```
