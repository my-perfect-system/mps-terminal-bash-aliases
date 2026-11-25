# mps-terminal-bash-aliases

System-wide bash aliases of the [my-perfect-system](https://github.com/my-perfect-system) (mps) terminal stack.

Each topic lives in its own `.bashrc_alias_<topic>` file. The main bash
configuration ([mps-terminal-bash](https://github.com/my-perfect-system/mps-terminal-bash))
sources every `/etc/bash_aliases.d/.bashrc_alias_*` file alphabetically,
then any per-user overrides from `~/.config/bash_aliases.d/.bashrc_alias_*`.

## Install

| Method | Command |
|---|---|
| Default | `curl -fsSL https://raw.githubusercontent.com/my-perfect-system/mps-terminal-bash-aliases/main/bootstrap.sh \| bash` |
| Ansible | role `odem.terminal.bash` of [odem-terminal](https://github.com/my-perfect-system/odem-terminal) |
| Standalone | `sudo ./install.sh` |

All methods copy the `.bashrc_alias_*` files to `/etc/bash_aliases.d/` (the sudo
password prompt reads the terminal, so `curl | bash` works). Requires
[mps-terminal-bash](https://github.com/my-perfect-system/mps-terminal-bash) or
any `.bashrc` that sources `/etc/bash_aliases.d/.bashrc_alias_*`.

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